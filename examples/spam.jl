cd(dirname(@__FILE__()))
using SMTP
SMTP.spam(["clh@ustc.edu.cn"]; subject = "Grizzly Bear", content = readstring("content.txt"))
