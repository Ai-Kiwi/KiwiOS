local MoniterX, MontierY = term.getSize()
local args = {...}

local function LoadTextInMiddleOfScreen(TextToWrite,TextToWriteBelow)
    term.clear()
    --makes a noice start prompt using auto scaled text 
    MoniterX, MontierY = term.getSize()

    local BigFont = require("libs.bigfont")


    local TextSizeX = #TextToWrite * 3
    local TextSizeY = 2

    term.setCursorPos(math.floor((MoniterX / 2) - (TextSizeX / 2)),math.floor((MontierY / 2) - (TextSizeY / 2)))

    BigFont.bigPrint(TextToWrite)
    if TextToWriteBelow then
        term.setCursorPos(math.floor((MoniterX / 2) - (#TextToWriteBelow / 2)),math.floor((MontierY / 2) + 1 + (TextSizeY / 2)))
        print(TextToWriteBelow)
    end
end

term.setBackgroundColor(colors.black)
term.setTextColor(colors.white)

--get verson installed
local function GetVersionInstalled()
    local VersionInstalled = nil
    local VersionFile = fs.open("OneOS/Version_Installed.txt","r")
    if VersionFile then
        VersionInstalled = VersionFile.readLine()
        VersionFile.close()
    end
    return VersionInstalled
end

if args[1] == "install" then
else
LoadTextInMiddleOfScreen("OneOS","Looking for updates")
if GetVersionInstalled() == "0.1" then
    --stop because no update needed
    error("", -1)
end


LoadTextInMiddleOfScreen("Updating")
end

local function VerfPathExists(FilePath)
    fs.makeDir(FilePath)
end


local function DownloadFile(FilePath,URL) 
    term.setCursorPos(1,MontierY)
    term.clearLine()
    term.write(FilePath)

    --make sure path is a thing
    VerfPathExists(fs.getDir(FilePath))


    --save file
    local File = fs.open(FilePath,"w")
    local DownloadedFile = http.get(URL .. "?cb=" .. math.random(1,10000))
    File.write(DownloadedFile.readAll())
    File.close()
end


--files in root
DownloadFile("startup.lua","https://raw.githubusercontent.com/Ai-Kiwi/OneOS/master/startup.lua")
--download files in OneOS
DownloadFile("OneOS/kernil.lua","https://raw.githubusercontent.com/Ai-Kiwi/OneOS/master/OneOS/kernil.lua")
DownloadFile("OneOS/startup.lua","https://raw.githubusercontent.com/Ai-Kiwi/OneOS/master/OneOS/startup.lua")
DownloadFile("OneOS/windowManager.lua","https://raw.githubusercontent.com/Ai-Kiwi/OneOS/master/OneOS/windowManager.lua")
--files in OneOs/sysapp
DownloadFile("OneOS/sysapp/appManager.lua","https://raw.githubusercontent.com/Ai-Kiwi/OneOS/master/OneOS/sysapp/appManager.lua")
DownloadFile("OneOS/sysapp/desktop.lua","https://raw.githubusercontent.com/Ai-Kiwi/OneOS/master/OneOS/sysapp/desktop.lua")
DownloadFile("OneOS/sysapp/desktop.lua","https://raw.githubusercontent.com/Ai-Kiwi/OneOS/master/OneOS/sysapp/desktop.lua")
DownloadFile("OneOS/sysapp/StartMenu.lua","https://raw.githubusercontent.com/Ai-Kiwi/OneOS/master/OneOS/sysapp/StartMenu.lua")
--files in OneOS/libs
DownloadFile("OneOS/libs/ToasterTools.lua","https://raw.githubusercontent.com/Ai-Kiwi/OneOS/master/OneOS/libs/ToasterTools.lua")
DownloadFile("OneOS/libs/bigfont.lua","https://raw.githubusercontent.com/Cheatoid/ComputerCraft-Cloud/main/typescript/Wojbie%20bigfont/out/bigfont.lua")

VerfPathExists("UserData/Desktop")
VerfPathExists("UserData/Apps")
VerfPathExists("UserData/Documents")
VerfPathExists("UserData/Pictures")
VerfPathExists("UserData/Music")
VerfPathExists("UserData/Videos")
VerfPathExists("UserData/Downloads")
VerfPathExists("UserData/Apps")



--edit the update file and replace the old one with the new one
local UpdateFile = fs.open("OneOS/Version_Installed.txt","w")
UpdateFile.write("0.1")
UpdateFile.close()

LoadTextInMiddleOfScreen("Update Complete","Thanks for waiting")
os.sleep(1)
