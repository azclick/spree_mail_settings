Spree::BaseMailer.class_eval do
  def from_address
    Spree::Config.preferred_mails_from
  end

  def mail(headers={}, &block)
    super if Spree::Config[:send_core_emails]
  rescue ActionView::Template::Error => e
    p e
  end
end
