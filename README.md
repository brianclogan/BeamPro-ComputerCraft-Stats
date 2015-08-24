# BeamPro-ComputerCraft-Stats
Gives you the ability using computer craft to get your current viewers, followers, and more, all with LUA.

## Installation ##
To use, the easiest way is by using pastebin. In Minecraft, the best layout is setting up a 1x3 monitor setup attached to a computer.
![basic setup](https://github.com/darkgoldblade01/BeamPro-ComputerCraft-Stats/blob/master/images/basic-setup.png)

By doing this, you are setup with the defaults used in the files. As long as there is a 1x3 monitor setup, and the computer is on one of the sides (top, bottom, left, right) you are set.

Open up the computer console. You should see CraftOS in the upper left corner. One you are ready, use the following lines in the terminal, and hit enter.

`pastebin get Z1SE9DLQ json`

![json api pastebin](https://github.com/darkgoldblade01/BeamPro-ComputerCraft-Stats/blob/master/images/json-api-pastebin.png)

That saves the JSON api that is required to use the APIs for Beam. Next is saving the Beam API script.

`pastebin get K7CZLKHG beampro`

![all apis saved](https://github.com/darkgoldblade01/BeamPro-ComputerCraft-Stats/blob/master/images/all-apis-saved.png)

Now, type `edit beampro` and you will see the config at the top of the script. That is it! Edit them to your liking. If you have any trouble, let me know on Twitter! @darkgoldblade


## Configuration ##
When you go and edit the beampro file, you will see this at the top:

`----- EDITABLE VARIABLES. Only edit the below.
streamid = "darkgoldblade01" --- the beam.pro username
SleepTime = 60 --- how often do you want to refresh in seconds? (default - 60)
direction = "right" --- this is the direction the monitors are
--- This next area is for deciding what you want on each line. The options are: followerCount, viewerCount, currentGame, and points
line1 = "viewerCount" -- default viewerCount
line2 = "followerCount" -- default followerCount
line3 = "currentGame" -- default currentGame

----- DO NOT EDIT BELOW THIS LINE! ----`

You can edit them to your liking. Simple as that! 
