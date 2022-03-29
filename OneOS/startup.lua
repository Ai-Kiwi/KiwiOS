local function LoadTextInMiddleOfScreen(TextToWrite,TextToWriteBelow)
    term.clear()
    --makes a noice start prompt using auto scaled text 
    local MoniterX, MontierY = term.getSize()

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

local function GetTextFromPercent(loadingPercent,TextSize,MaxSize)
    ASCII = "$@B%8&WM#*oahkbdpqwmZO0QLCJUYXzcvunxrjft/\\|()1{}[]?-_+~<>i!lI;:,\"^`'. "
    local StartingText = ""
    for i=1, TextSize do
        if (i * MaxSize / TextSize) > loadingPercent then
            StartingText = StartingText .. "."
        else
            if ((i + 1) * MaxSize / TextSize) > loadingPercent then
                StartingText = StartingText .. ">"
            else
                StartingText = StartingText .. "-"
            end
        end

    end
    StartingText = StartingText .. " " .. math.floor((loadingPercent / MaxSize) * 100) .. "%"
    return StartingText
end



LoadTextInMiddleOfScreen("OneOS")
os.sleep(1)
LoadTextInMiddleOfScreen("OneOS","updating updater")
--download Update file
--code not done

--run
shell.run("OneOS/temp/Update.lua")


shell.run("OneOs/kernil.lua")

