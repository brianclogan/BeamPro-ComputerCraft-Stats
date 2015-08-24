streamid = "darkgoldblade01"
SleepTime = 60
os.loadAPI("json")
local m = peripheral.wrap("right")
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
                m.write("Live Viewers: Offline")
        else
                m.setBackgroundColor(colors.yellow)
                m.clear()
                m.write(streamid)
                m.setCursorPos(1,4)
                m.write("Live Viewers: ")
                m.write(live)          
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