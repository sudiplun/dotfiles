-- Add any other personal Hyprland configuration below.
o.window("qemu", { workspace = "5" })
o.window("chromium", { workspace = "1" })
o.window("ghostty", { workspace = "2" })
o.window("google-chrome", { workspace = "7" })
o.window("org.telegram.desktop", { workspace = "9" })
o.window("org.gnome.Nautilus", { workspace = "4" })
o.window("com.thisisgm.flea", { workspace = "4" })
o.window("KeePassXC", { workspace = "6" })

-- border colors
hl.window_rule({ match = { title = ".*(?i)Hyprland.*" }, border_color = "rgb(FFFF00)" })
hl.window_rule({ match = { title = ".*nvim.*" }, border_color = "rgb(007C00)" })
hl.window_rule({ match = { title = ".*mattermost.*" }, border_color = "rgb(FFBC1F)" })
hl.window_rule({ match = { title = ".*(?i)Google.*" }, border_color = "rgb(4285F4)" })
hl.window_rule({ match = { title = ".*(?i)sign|login.*" }, border_color = "rgb(A6FF98)" })
hl.window_rule({ match = { title = ".*mpv.*" }, border_color = "rgb(36123D)", border_size = 5 })
hl.window_rule({
  match = { title = ".*KeePassXC.*" },
  border_color = "rgb(FF0800)",
  no_screen_share = true,
  border_size = 7,
})
hl.window_rule({ match = { class = "org.xfce.mousepad" }, float = true })
