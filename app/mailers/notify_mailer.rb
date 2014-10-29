class NotifyMailer < ActionMailer::Base
  default from: "postmaster#{ENV['MAILGUN_DOMAIN']}"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notify_mailer.send.subject
  #
  def send_mail(user)
    @greeting = "Hi #{user.name}"

    mail to: user.email
  end
end
