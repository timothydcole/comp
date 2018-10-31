class ApplicationMailer < ActionMailer::Base
  default from: 'no_reply@repair-this.com'
  layout 'mailer'
end
