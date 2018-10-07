# Dpos-Bot

This script has the function to check if your server is UP and SYNCED with the network, otherwise a notification, trough telegram (down or not synced) or trough pushbullet (server down), will be sent.

**Pre-Requirements:**

```
sudo apt-get update && sudo apt-get install jq nano curl -y
wget https://raw.githubusercontent.com/gregorst3/Dpos-Bot/master/DposScript.sh
```
If dpos uses an old core :
```
wget https://raw.githubusercontent.com/gregorst3/Dpos-Bot/master/DposScript0.9.sh
```

How to use this script:

This script every 120 seconds should check if server is available and synced.

`nano DposScript.sh`


_REMEMBER: You have to whitelist the ip of the server where the bot is running into the server where the dpos-node is active.
(Ex: lisk-main/config.json | shift/config.json_


  `"api": {
        "enabled": true,
        "access": {
            "public": false,
            "whiteList": ["127.0.0.1","10.0.2.1]
            `                             ←
                                        This is the bot server ip (10.0.2.1)    

**Modify the following:**

```SRV=IPSERVER:PORT
MESSAGE="Server SERVERNAME Is not synced with the network"
MEX="Server SERVERNAME Is DOWN"
CHATID=111111
apiToken=TELEGRAMTOKEN

TITLE="ATTENTION"
ACCESS_TOKEN="PUSHBULLETTOKEN"`
Ctrl x + y
```
**How to retrieve chat id?**

Open telegram and start @userinfobot

**How to retrieve apiToken?**

Open telegram and start @BotFather and follow instruction to create a bot (two or three clicks), after it will give you a token

**How to retrieve PUSHBULLETTOKEN**?

Go on https://www.pushbullet.com/#settings (Settings> Create Access token)

To start the script use 
```
screen bash DposScript.sh
```
**If you use it for dpos with old core (<1.0) please use DposScript0.9.sh**
