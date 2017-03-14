# SMTP Client for Julia

## Install

```julia
Pkg.clone("https://github.com/AStupidBear/Utils.jl.git")
Pkg.clone("https://github.com/AStupidBear/SMTP.jl.git")
```

## Usage

```julia
using SMTP
from = "luandui005316391@163.com"
passwd = "yuanchensiduan"
tos = ["clh@ustc.edu.cn"]
server = "smtp.163.com"
subject = "Bear"
content = "I'm a grizzly bear."
files = []
sendmail(from, passwd, tos, server, subject, content, files)
```
