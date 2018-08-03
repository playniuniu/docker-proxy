Docker for goproxy

This is docker for [https://github.com/snail007/goproxy](https://github.com/snail007/goproxy)

Run:

```bash
docker run -d --restart=always --name goproxy -e OPTS="http -p :33080" -p 33080:33080 playniuniu/goproxy
```