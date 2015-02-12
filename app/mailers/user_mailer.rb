class UserMailer < ActionMailer::Base
  default from: "admin@example.com"

  def activation_email(user)
    @email = user.email
    @activation_url =
      activate_users_url(activation_token: user.activation_token)
    mail(to: user.email, subject: 'Activate Your Music Manager Account')
  end
end
