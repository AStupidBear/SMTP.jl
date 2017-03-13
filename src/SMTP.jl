"""
    from = "luandui005316391@163.com"
    passwd = "yuanchensiduan"
    tos = ["luyaocns@163.com"]
    smtp_server = "smtp.163.com"
    subject="hi"
    text = "123"
    files = []
    sendmail(from, passwd, tos, smtp_server, subject, text,files)
"""
module SMTP

using PyCall

@static if is_linux()
  unshift!(PyVector(pyimport("sys")["path"]), dirname(@__FILE__))
  @pyimport mail
  sendmail = mail.sendmail
  export sendmail
elseif is_windows()
  using Utils: ps
  include("mail.jl")
  export sendmail
end

include("spam.jl")

end

# ENV["PYTHON"]="/home/rluser/Software/anaconda3/bin/python"
# # ENV["PYTHON"]="/home/rluser/Software/anaconda2/bin"
# Pkg.build("PyCall")
#
# using PyCall;
# @pyimport smtplib;
# @pyimport email
#
#
# fromaddr = "luandui005316391@163.com";
# toaddrs = "malcolm@amisllp.com";
# messy = """From: $fromaddr
# To: $toaddrs
# Subject: Test SMTP using PyCall
#
# Testing - 1,2,3
# """
# username = fromaddr;
# password = "yuanchensiduan"; # Not my real password
# server = pycall(smtplib.SMTP,PyAny,"smtp.163.com:25");
# # server[:ehlo]()
# # server[:starttls]()
# server[:login](username,password)
# server[:sendmail](fromaddr,toaddrs,messy)
# server[:quit]()
