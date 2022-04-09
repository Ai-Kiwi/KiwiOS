--tests if its running on moblie
if pocket then
    
else
    -- open_new_app <name> <path> <order> <WindowMode>
    coroutine.yield("open_new_app", "desktop", "OneOS/sysapp/desktop.lua", -250, "2")
    coroutine.yield("open_new_app", "taskbar", "OneOS/sysapp/taskbar.lua", 100, "3")
end



while true do
    os.sleep(1)
end
