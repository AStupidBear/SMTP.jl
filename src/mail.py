from email import encoders
from email.header import Header
from email.utils import parseaddr, formataddr
import sys, smtplib

if sys.version_info >= (3,):
    from email.mime.base import MIMEBase
    from email.mime.text import MIMEText
    from email.mime.multipart  import MIMEMultipart
else:
    from email.MIMEBase import MIMEBase
    from email.MIMEText import MIMEText
    from email.MIMEMultipart  import MIMEMultipart

def _format_addr(s):
    name, addr = parseaddr(s)
    return formataddr((Header(name, 'utf-8').encode(), addr))

def sendmail(from_addr, passwd, to_addrs, smtp_server, sub, text, files=[]):
    msg = MIMEMultipart()

    part = MIMEText(text, 'plain', 'utf-8')
    msg.attach(part)

    for file in files:
        filename = file.split('/')[-1]
        attachment = open(file, "rb")
        part = MIMEBase('application', 'octet-stream')
        part.set_payload(attachment.read())
        encoders.encode_base64(part)
        part.add_header('Content-Disposition', "attachment; filename= %s" % filename)
        msg.attach(part)

    msg['From'] = _format_addr('GrizzlyBear <%s>' % from_addr)
    msg['To'] = _format_addr('Demon <%s>' % to_addrs[0])
    msg['Subject'] = Header(sub, 'utf-8').encode()

    server = smtplib.SMTP(smtp_server, 25)
    # server.set_debuglevel(1)
    # server.ehlo()
    # server.starttls()
    server.login(from_addr, passwd)
    server.sendmail(from_addr, to_addrs, msg.as_string())
    server.quit()
