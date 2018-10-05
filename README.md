# Dpos-Bot

This script has the function to check if your server is UP and SYNCED with the network, otherwise a notification, trough telegram (down or not synced) or trough pushbullet (server down), will be sent.

Pre-Requirements:

```
sudo apt-get update && sudo apt-get install jq -y
wget https://raw.githubusercontent.com/gregorst3/Dpos-Bot/master/DposScript.sh
```
If dpos uses an old core :
```
wget https://raw.githubusercontent.com/gregorst3/Dpos-Bot/master/DposScript0.9.sh
```

How to use this script:

This screen every 120 seconds should check if server is available and synced.

`nano DposScript.sh`

**Modify the following:**

REMEMBER: Ensure you have permission to do api queries (whitelist the ip of the machine where this script is running, into the api section of dpos config)

**How to retrieve chat id?**

Open telegram and start @userinfobot

**How to retrieve apiToken?**

Open telegram and start @BotFather and follow instruction to create a bot (two or three clicks), after it will give you a token

**How to retrieve PUSHBULLETTOKEN**?

Go on https://www.pushbullet.com/signin?next=%2F and you will find it in your area, pushbullet is an optional

```SRV=IPSERVER:PORT
MESSAGE="Server SERVERNAME Is not synced with the network"
MEX="Server SERVERNAME Is DOWN"
CHATID=111111
apiToken=TELEGRAMTOKEN

TITLE="ATTENTION"
ACCESS_TOKEN="PUSHBULLETTOKEN"`
Ctrl x + y
```
To start the script use 
```
screen bash DposScript.sh
```
If you use it for dpos with old core (<1.0) please use DposScript0.9.sh
