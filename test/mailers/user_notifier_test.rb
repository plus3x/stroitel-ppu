require 'test_helper'

class UserNotifierTest < ActionMailer::TestCase
  test "invoice" do
    email = 'garry@bob.com'
    manager_phone = '555-55-55'
    
    subject = I18n.t('user_notifier.invoice.subject')
    text_body = I18n.t('user_notifier.invoice.body.text', phone: manager_phone)
    html_body = I18n.t('user_notifier.invoice.body.html', phone: manager_phone)
    
    mail = UserNotifier.invoice(email)
    
    assert_equal subject, mail.subject
    assert_equal [email], mail.to
    assert_equal ["from@testing.com"], mail.from
    assert_equal text_body, mail.text_part.body.to_s
    assert_equal html_body, mail.html_part.body.to_s
  end
end