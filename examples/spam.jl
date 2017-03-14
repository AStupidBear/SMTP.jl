cd(dirname(@__FILE__()))
using SMTP
SMTP.spam(["clh@ustc.edu.cn"], "Grizzly Bear", readstring("content.txt"))
