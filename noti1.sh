#! /bin/bash -l

ps cax | grep pm2 > /dev/null
if [ $? -eq 0 ]; then
  echo $(date -u) - "PM2 is running."
else
  echo $(date -u) - "Vamo a reiniciar."
  #cd ~/app-location
  #~/bin/node ~/bin/pm2 start all
fi
