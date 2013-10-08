class UserNotifier < ActionMailer::Base

  # Subject and body can be set in your I18n file at config/locales/(en|ru).yml
  # with the following lookup:
  #
  #   (en|ru).user_notifier.invoice.subject
  #   (en|ru).user_notifier.invoice.body.(text|html)
  #
  def invoice(email)
    @manager_phone = '555-55-55'
    
    mail to: email
  end
end
