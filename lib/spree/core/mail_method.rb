module Spree
  module Core
    class MailMethod
      def initialize(options = {})
      end

      def deliver!(mail)
        p "======> HELLLO FROM HERE :)"
        if Config.enable_mail_delivery
          mailer.deliver!(mail)
        end
      end

      def mailer
        mailer_class.new(mail_server_settings)
      end

      private

      def mailer_class
        if Rails.env.test?
          Mail::TestMailer
        else
          ::Mail::SMTP
        end
      end

      def mail_server_settings
        MailSettings.new.mail_server_settings
      end
    end
  end
end
