function sendmail(from, passwd, tos, smtp_server, subject, content, files = [])
  str = """
  \$emailSmtpServer = "$smtp_server"
  \$emailSmtpServerPort = "25"
  \$emailSmtpUser = "$from"
  \$emailSmtpPass = "$passwd"
  \$emailMessage = New-Object System.Net.Mail.MailMessage
  \$emailMessage.From = "GrizzlyBear <$from>"
  \$emailMessage.Subject = "$subject"
  \$emailMessage.IsBodyHtml = \$false
  \$emailMessage.Body = @"
  $content
  "@
  """
  for to in tos
    str *= """\$emailMessage.To.Add("$to")\n"""
  end
  for file in files
    str *= """\$emailMessage.Attachments.Add("$file")\n"""
  end
  str *= """
  \$SMTPClient = New-Object System.Net.Mail.SmtpClient( \$emailSmtpServer , \$emailSmtpServerPort )
  \$SMTPClient.EnableSsl = \$true
  \$SMTPClient.Credentials = New-Object System.Net.NetworkCredential( \$emailSmtpUser , \$emailSmtpPass )
  \$SMTPClient.Send( \$emailMessage )
  """
  ps(str)
end
