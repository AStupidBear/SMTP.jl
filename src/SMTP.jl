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
