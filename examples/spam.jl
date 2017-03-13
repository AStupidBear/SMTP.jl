cd(dirname(@__FILE__()))

# using SMTP
# subject = "JuliaPro v0.5.0.1 Download"
# text = readstring("content.txt")
# files = ["zhao.pdf"]
# SMTP.spam(["clh@ustc.edu.cn"], subject = subject, text = text, files = files)

open("tmp.txt","a") do f
  write(f, "hi\n")
end