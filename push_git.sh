now=`date '+%Y/%m/%d %A %H:%M:%S'`
read -p "description: " dsc
git add . ; git commit -m "$now $dsc" ; git push origin master