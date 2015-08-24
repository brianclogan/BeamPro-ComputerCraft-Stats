----- EDITABLE VARIABLES. Only edit the below.
streamid = "darkgoldblade01" --- the beam.pro username
SleepTime = 60 --- how often do you want to refresh in seconds? (default - 60)
direction = "right" --- this is the direction the monitors are

----- DO NOT EDIT BELOW THIS LINE! ----
os.loadAPI("json-api")
local m = peripheral.wrap(direction)
m.setCursorPos(1,1)
function getFollowers()
        str = http.get("https://beam.pro/api/v1/channels/" .. streamid).readAll()
        obj = json.decode(str)
        follows = json.encodePretty(obj.numFollowers)
        m.setCursorPos(1,3)    
        m.write("Beam Pro Followers: ")
        m.write(follows)
        return follows
end
function getViewerCount()
        lstr = http.get("https://beam.pro/api/v1/channels/" .. streamid).readAll()
        lobj = json.decode(lstr)
        live = json.encodePretty(lobj.online)
        m.setCursorPos(1,1)
        if live == false then
                m.write(streamid)
                m.setCursorPos(1,4)
                m.write("Current Viewers: Offline")
        else
                m.setBackgroundColor(colors.yellow)
                m.clear()
                m.write(streamid)
                m.setCursorPos(1,4)
                m.write("Current Viewers: ")
                m.write(lobj.viewersCurrent)          
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
        local status, live = pcall(function () getViewerCount() end)
        if status then
                -- do nothing
        else
                m.write("Not Currently Streaming")
        end
        local status, followsCount = pcall(function () getFollowers() end)
        m.setCursorPos(1,3)    
        if status then         
                -- do nothing
        else           
                m.write("Beam Pro Followers: Loading...")
        end
        sleep(SleepTime)
end