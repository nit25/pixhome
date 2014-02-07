class UserMailer < ActionMailer::Base
  default from: "mail.google.com"

 
  def firstemail(email)
  		mail(:to => email, :subject => "Welcome to Pictures" )
  end
end
