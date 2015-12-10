require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "account_activation" do
    user = User.create( name: "Agatha",
    email: "agatha@agatha.com",
    password: "foobar",
    password_confirmation: "foobar",
    activated: true,
    activated_at: Time.zone.now)

    user.activation_token = User.new_token
    let(:mail) { UserMailer.account_activation(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Please confirm your Blocmetrics account")
      expect(mail.to).to eq(["agatha@agatha.com"])
      expect(mail.from).to eq(["eirinikos@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "password_reset" do
    user = User.create( name: "Agatha",
    email: "agatha@agatha.com",
    password: "foobar",
    password_confirmation: "foobar",
    activated: true,
    activated_at: Time.zone.now)

    user.reset_token = User.new_token
    let(:mail) { UserMailer.password_reset(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Blocmetrics password reset")
      expect(mail.to).to eq(["agatha@agatha.com"])
      expect(mail.from).to eq(["eirinikos@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
