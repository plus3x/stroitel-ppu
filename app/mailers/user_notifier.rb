class UserNotifier < ActionMailer::Base

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   ru.user_notifier.invoice.subject
  #   ru.user_notifier.invoice.body.(text|html)
  #
  def invoice(email)
    @manager_phone = '555-55-55'
    
    mail to: email
  end
end
