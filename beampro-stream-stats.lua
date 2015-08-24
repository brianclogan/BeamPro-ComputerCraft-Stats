----- EDITABLE VARIABLES. Only edit the below.
streamid = "darkgoldblade01" --- the beam.pro username
SleepTime = 60 --- how often do you want to refresh in seconds? (default - 60)
direction = "right" --- this is the direction the monitors are
--- This next area is for deciding what you want on each line. The options are: followerCount, viewerCount, currentGame, and points
line1 = "followerCount"
line2 = "currentGame"


----- DO NOT EDIT BELOW THIS LINE! ----


os.loadAPI("json")
local m = peripheral.wrap(direction)
m.setCursorPos(1,1)
-- Function to get follower counts
function getFollowers()
        str = http.get("https://beam.pro/api/v1/channels/" .. streamid).readAll()
        obj = json.decode(str)
        follows = json.encodePretty(obj.numFollowers)
        m.write("Beam Pro Followers: ")
        m.write(follows)
        return follows
end
-- function to get current viewer count
function getViewerCount()
        lstr = http.get("https://beam.pro/api/v1/channels/" .. streamid).readAll()
        lobj = json.decode(lstr)
        live = json.encodePretty(lobj.online)
        if live == false then
                m.write(streamid)
                m.write("Current Viewers: Offline")
        else
                m.setBackgroundColor(colors.yellow)
                m.clear()
                m.write(streamid)
                m.write("Current Viewers: ")
                m.write(lobj.viewersCurrent)          
        end
        return live
end
-- function to get current game
function getCurrentGame()
        lstr = http.get("https://beam.pro/api/v1/channels/" .. streamid).readAll()
        lobj = json.decode(lstr)
        live = json.encodePretty(lobj.online)
        if live == false then
                m.write(streamid)
                m.write("Currently Playing: Offline")
        else
                m.setBackgroundColor(colors.yellow)
                m.clear()
                m.write(streamid)
                m.write("Currently Playing: ")
                m.write(lobj.type.name)          
        end
        return live
end
-- function to get points
function getPoints()
        lstr = http.get("https://beam.pro/api/v1/channels/" .. streamid).readAll()
        lobj = json.decode(lstr)
        live = json.encodePretty(lobj.online)
        if live == false then
                m.write(streamid)
                m.write("Points: Offline")
        else
                m.setBackgroundColor(colors.yellow)
                m.clear()
                m.write(streamid)
                m.write("Currently Playing: ")
                m.write(lobj.type.name)          
        end
        return live
end
while true do
        m.setCursorPos(1,1)
        m.setBackgroundColor(colors.white)
        m.setTextColor(colors.blue)
        m.setTextScale(1)
        m.clear()
        m.write(streamid)
        m.setCursorPos(1,2)
        
        if line1 == "followerCount" then 
            getFollowers()
        else if line1 == "viewerCount" then
            local status, live = pcall(function () getViewerCount() end)
            if status then
                    -- do nothing
            else
                    m.write("Not Currently Streaming")
            end
        else if line1 == "currentGame" then
            local status, live = pcall(function () getCurrentGame() end)
            if status then
                    -- do nothing
            else
                    m.write("Not Currently Streaming")
            end
        else if line1 == "points" then
            getPoints()
        else
            local status, live = pcall(function () getViewerCount() end)
            if status then
                    -- do nothing
            else
                    m.write("Not Currently Streaming")
            end     
        end

        m.setCursorPos(1,3)
        if line2 == "followerCount" then 
            getFollowers()
        else if line2 == "viewerCount" then
            local status, live = pcall(function () getViewerCount() end)
            if status then
                    -- do nothing
            else
                    m.write("Not Currently Streaming")
            end
        else if line2 == "currentGame" then
            local status, live = pcall(function () getCurrentGame() end)
            if status then
                    -- do nothing
            else
                    m.write("Not Currently Streaming")
            end
        else if line2 == "points" then
            getPoints()
        else
            local status, live = pcall(function () getViewerCount() end)
            if status then
                    -- do nothing
            else
                    m.write("Not Currently Streaming")
            end     
        end
        sleep(SleepTime)
end