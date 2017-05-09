ffmpeg -re -f image2 -loop 1 -i /some/image.jpg -s 128x128 -f flv rtmp://127.0.0.1:1935/show/camera_1

# use x264; ffmpeg needs to be compiled with ffmpeg support
# ffmpeg -re -f image2 -loop 1 -i /some/image.jpg -vcodec libx264 -s 128x128 -f flv rtmp://127.0.0.1:1935/show/stream