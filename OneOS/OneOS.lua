--tests if its running on moblie
if false then
    coroutine.yield("open_new_app", "MobileUI", "OneOS/sysapp/MobileUI.lua", -100, "2")
else
    -- open_new_app <name> <path> <order> <WindowMode>
    coroutine.yield("open_new_app", "desktop", "OneOS/sysapp/desktop.lua", -250, "2")
    coroutine.yield("open_new_app", "taskbar", "OneOS/sysapp/taskbar.lua", 100, "3")
end

