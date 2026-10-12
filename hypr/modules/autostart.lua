hl.window_rule({
    name = "zen-autostart",
    match = { class = "zen" },
    opacity = "0.95 override 0.98 override",
    workspace = 3
})

hl.on("hyprland.start", function() 
    hl.exec_cmd("zen")

    hl.timeout(20000, function()
        hl.remove_window_rule("zen-autostart")
    end)
end)

hl.window_rule({
    name = "discord-autostart",
    match = { class = "discord" },
    opacity = "0.60 override 0.15 override",
    workspace = 2
})

hl.on("hyprland.start", function() 
    hl.exec_cmd("discord")

    hl.timeout(20000, function()
        hl.remove_window_rule("discord-autostart")
    end)
end)

hl.window_rule({
    name = "kitty-autostart",
    match = { class = "kitty" },
    opacity = "0.87 override 0.98 override",
    workspace = 1
})

hl.on("hyprland.start", function() 
    hl.exec_cmd("kitty")

    hl.timeout(20000, function()
        hl.remove_window_rule("kitty-autostart")
    end)
end)