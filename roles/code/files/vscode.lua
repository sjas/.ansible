-- THIS SHOULD HAVE WORKED WITH DEVILSPIE V1
-- (if (contains (window_class) "Code")
--      (begin
--              (spawn_async (str "xprop -id " (window_xid) " -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 "))
--              (spawn_async (str "xprop -id " (window_xid) " -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY 0xdfffffff"))
--      )
-- )

-- debug_print("Window Name: " .. get_window_name());
-- debug_print("Application name: " .. get_application_name());
if (get_application_name() == "Visual Studio Code") then
    set_window_opacity(0.89)
    set_window_size(1000, 650)
    center()
end

