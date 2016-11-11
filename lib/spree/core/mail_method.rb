# docker-compose -f production.yml run --rm shoryuken rails c
# Apartment::Tenant.switch! "gravity"
# order = Spree::Order.where(email: "yurifrl@hotmail.com").first
# Spree::OrderMailer.confirm_email(order, true).deliver_now!
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

      def settings
        p '=========='
        p caller[0]
        p 'https://github.com/mikel/mail/blob/master/lib/mail/message.rb#L255'
        p '=========='
        {
          return_response: true
        }
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
