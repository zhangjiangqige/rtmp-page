# 图片到视频流

## 结构

服务端图片 -> ffmpeg rtmp推流 -> nginx -> 浏览器

## 各种配置

### 图片

比如，不停覆盖写到/some/image.jpg

### ffmpeg

rtmp_stream.sh

```
ffmpeg -re -f image2 -loop 1 -i /some/image.jpg -s 128x128 -f flv rtmp://127.0.0.1:1935/show/camera_1
```

其中
- -i后是输入图片路径
- -s是输出分辨率
- 最后的rtmp是Nginx的RTMP监听地址；show是其中的application的名字；camera_1是输出的视频名，需要在网页上对应

### nginx

依赖https://github.com/arut/nginx-rtmp-module

#### 编译

下载nginx和nginx-rtmp-module

nginx目录下

```
./configure --prefix=/path/to/install/nginx --add-module=/path/to/nginx-rtmp-module
make -j10
make install
```

#### 配置

nginx.conf

```
rtmp {
    server {
        listen 1935; # Standard RTMP port
        chunk_size 4000;

        application show {
            live on;
        }
    }
}
```

这里的application show对应着ffmpeg的输出地址

### 网页

使用video.js

参考index.html