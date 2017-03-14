## SMTP Client for Julia

```julia
using SMTP
from = "luandui005316391@163.com"
passwd = "yuanchensiduan"
tos = ["clh@ustc.edu.cn"]
server = "smtp.163.com"
subject = "Bear"
text = "I'm a grizzly bear."
files = []
sendmail(from, passwd, tos, server, subject, text, files)
```
