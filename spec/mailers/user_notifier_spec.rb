describe UserNotifier do
  describe '#invoice' do
    let(:mail)          { UserNotifier.invoice(email) }
    let(:mail_subject)  { I18n.t 'user_notifier.invoice.subject' }
    let(:text_body)     { I18n.t 'user_notifier.invoice.body.text', phone: manager_phone }
    let(:html_body)     { I18n.t 'user_notifier.invoice.body.html', phone: manager_phone }
    let(:manager_phone) { '555-55-55' }
    let(:email)         { 'some@mail.com' }

    it 'renders the headers' do
      expect(mail.subject).to eq mail_subject
      expect(mail.to     ).to eq [email]
      expect(mail.from   ).to eq ['from@testing.com']
    end

    it 'renders the body(html|text)' do
      expect(mail.text_part.body.to_s).to eq text_body
      expect(mail.html_part.body.to_s).to eq html_body
    end
  end
end
