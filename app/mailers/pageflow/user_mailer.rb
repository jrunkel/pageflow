module Pageflow
  class UserMailer < ActionMailer::Base
    include Resque::Mailer

    def invitation(options)
      @user = User.find(options['user_id'])
      locale = @user.locale unless @user.locale.blank?
      I18n.with_locale(locale || I18n.locale) do
        mail(:to => @user.email, :subject => t('.subject'), :from => Pageflow.config.mailer_sender)
      end
    end
  end
end
