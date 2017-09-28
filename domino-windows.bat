"C:\Program Files (x86)\Xming\Xming.exe" -multiwindow -clipboard -ac
docker run -ti --net=host -e DISPLAY=192.168.46.28:0 laramaktub/docker-domino DOMINO