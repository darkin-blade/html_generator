# Debug

- `ly`报错

缺少`liby.a`的库,`sudo apt install libbison-dev`

- `multiple definition`

在头文件中不要定义全局变量,全局变量要在`.c`文件中定义,再在`.h`中使用`extern`引用,同时记得`make clean`

- `malloc`:`corrupted top`

是由于之前字符串使用的空间大于`malloc`申请的空间导致`malloc`信息被破坏
