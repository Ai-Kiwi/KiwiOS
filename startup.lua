local DevMode = false
if DevMode == true then
    --starts with auto updates on
    shell.run("OneOs/startup.lua false")
else
    shell.run("OneOs/startup.lua true")
end
