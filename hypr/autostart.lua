-- Extra autostart processes.
-- o.launch_on_start("my-service")
--
-- disable apps
hl.on("hyprland.start", function()
  hl.exec_cmd("sleep 3 && pkill -f 'udiskie --automount'")
end)
