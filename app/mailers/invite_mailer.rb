# Send invitations to new and existing users.
class InviteMailer < ActionMailer::Base
  default from: 'reply@example.com'
  #before_action :mailer_set_url_options




  def existing_user(invite)
    @invite = invite
    mail(
      from: Invitation.configuration.mailer_sender,
      to: @invite.email,
      subject: I18n.t('invitation.invite_mailer.existing_user.subject')
    )
  end

  def new_user(invite)
    @invite = invite
    @user_registration_url = Invitation.configuration.user_registration_url.call(invite_token: @invite.token)
    mail(
      from: Invitation.configuration.mailer_sender,
      to: @invite.email,
      subject: I18n.t('invitation.invite_mailer.new_user.subject')
    )
  end

#private 

#def mailer_set_url_options
  #ActionMailer::Base.default_url_options = { host: 'local', port:3000 }
#end
end
