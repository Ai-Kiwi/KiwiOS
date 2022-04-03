local function DownloadFile(FilePath,URL) 
    print("Downloading " .. URL .. " to " .. FilePath)

    --make sure path is a thing
    fs.makeDir(fs.getDir(FilePath))


    --save file
    local File = fs.open(FilePath,"w")
    local DownloadedFile = http.get(URL .. "?cb=" .. math.random(1,10000))
    File.write(DownloadedFile.readAll())
    File.close()
end

term.setBackgroundColor(colors.black)
term.setTextColor(colors.yellow)
print("Thank you for chosing OneOS")
print("please types \"yes\" to confirm you wanna install OneOS")
if (read() ~= "yes") then
    print("You have not typed \"yes\"")
    print("Exiting installer")
    error("",-1)
end
term.setTextColor(colors.white)
print("Installing...")
print("creating document folder...")
fs.makeDir("/UserData/Documents/")
print("moving all user data over to documents folder")
local UserData = fs.list("/")
for k,v in UserData do
    fs.move("/" .. v,"/UserData/Documents/" .. v)
end


DownloadFile("OneOS/libs/bigfont.lua","https://raw.githubusercontent.com/Cheatoid/ComputerCraft-Cloud/main/typescript/Wojbie%20bigfont/out/bigfont.lua")
DownloadFile("OneOS/Update.lua","https://raw.githubusercontent.com/OneOS/OneOS/master/OneOS/Update.lua")
print("running update")
shell.run("OneOS/Update.lua")
print("rebooting...")
os.reboot()

