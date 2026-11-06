Name = "system-info"
NamePretty = "System Info"
Icon = "utilities-system-monitor"
Cache = false
Description = "System information and controls"
SearchName = true
FixedOrder = true

local function command(cmd)
    local handle = io.popen(cmd .. " 2>/dev/null")
    if not handle then return "" end
    local result = handle:read("*a") or ""
    handle:close()
    return result:gsub("%s+$", "")
end

local function get_volume()
    local value = command("wpctl get-volume @DEFAULT_AUDIO_SINK@")
    local volume = tonumber(value:match("([%d%.]+)"))
    if not volume then return "Unknown" end
    return math.floor(volume * 100 + 0.5) .. "%"
end

local function get_brightness()
    local value = command("brightnessctl -m")
    local percentage = value:match(",(%d+)%%")
    return percentage and percentage .. "%" or "Unknown"
end

local function get_battery()
    local value = command(
        "cat /sys/class/power_supply/BAT*/capacity"
    )
    return value ~= "" and value .. "%" or "Unavailable"
end

-- Calendar generation
local function calendar_preview()
    local now = os.date("*t")

    local weekdays = {"Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"}

    local months = {}

    for offset = -1, 1 do
        local month = now.month + offset
        local year = now.year

        if month < 1 then
            month = 12
            year = year - 1
        elseif month > 12 then
            month = 1
            year = year + 1
        end

        table.insert(months, {
            year = year,
            month = month,
            name = os.date("%B", os.time({
                year = year,
                month = month,
                day = 1
            }))
        })
    end

    local function days_in_month(year, month)
        return os.date("*t", os.time({
            year = year,
            month = month + 1,
            day = 0
        })).day
    end

    local blocks = {}

    for _, info in ipairs(months) do
        local lines = {}

        table.insert(lines,
            string.format(
                '<span foreground="#89b4fa" weight="bold">%s %d</span>',
                info.name,
                info.year
            )
        )

        table.insert(lines,
            '<span foreground="#a6adc8">Mo Tu We Th Fr Sa Su</span>'
        )

        local first_day = os.date("*t", os.time({
            year = info.year,
            month = info.month,
            day = 1
        })).wday

        -- Lua: Sunday = 1. Convert to Monday = 1.
        local start = (first_day + 5) % 7 + 1

        local total_days = days_in_month(info.year, info.month)

        local day = 1

        while day <= total_days do
            local row = {}

            for col = 1, 7 do
                local position = (day == 1 and start or 1)

                if day == 1 and col < start then
                    table.insert(row, "  ")
                elseif day <= total_days then
                    local cell = string.format("%2d", day)

                    if info.year == now.year
                        and info.month == now.month
                        and day == now.day then

                        cell = string.format(
                            '<span background="#89b4fa" foreground="#1e1e2e" weight="bold">%2d</span>',
                            day
                        )
                    elseif col == 6 or col == 7 then
                        cell = string.format(
                            '<span foreground="#f38ba8">%2d</span>',
                            day
                        )
                    end

                    table.insert(row, cell)
                    day = day + 1
                else
                    table.insert(row, "  ")
                end
            end

            table.insert(lines, table.concat(row, " "))
        end

        blocks[#blocks + 1] = lines
    end

    -- Stack months vertically.
    local output = {
        string.format(
            '<span font_family="monospace" weight="bold" size="32pt">%s</span>',
            os.date("%H:%M")
        ),
        '<span font_family="monospace">'
    }

    for index, block in ipairs(blocks) do
        if index > 1 then
            output[#output + 1] = ""
        end

        for _, line in ipairs(block) do
            output[#output + 1] = line
        end
    end

    output[#output + 1] = '</span>'

    return table.concat(output, "\n")
end

function GetEntries()
    local entries = {}

    -- 1. Volume
    table.insert(entries, {
        Text = "Main Volume",
        Subtext = get_volume(),
        Icon = "audio-volume-high",
        Actions = {
            volume_up = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+",
            volume_down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-",
            volume_mute = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle",
        },
        Preview = calendar_preview(),
        PreviewType = "pango",
    })

    -- 2. Battery
    table.insert(entries, {
        Text = "Battery",
        Subtext = get_battery(),
        Icon = "battery-full",
    })

    -- 3. Brightness
    table.insert(entries, {
        Text = "Screen Brightness",
        Subtext = get_brightness(),
        Icon = "display-brightness",
        Actions = {
            brightness_up = "brightnessctl set 5%+",
            brightness_down = "brightnessctl set 5%-",
        },
    })


    return entries
end

