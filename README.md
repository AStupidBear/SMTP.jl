# SMTP Client for Julia

## Install

```julia
Pkg.clone("https://github.com/AStupidBear/SMTP.jl.git")
Pkg.build("SMTP")
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
