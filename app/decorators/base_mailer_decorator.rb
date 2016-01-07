Spree::BaseMailer.class_eval do
  def from_address
    Spree::Config.preferred_mails_from
  end

  def mail(headers={}, &block)
    if Spree::Config.get_preference(:enable_mail_delivery)
      super
    else
      return "O envio de email não está configurado"
    end
  rescue ActionView::Template::Error => e
    p e
    return "Ocorreu um erro, seu email não pode ser entregue, por favor contacte o administrador da loja"
  rescue StandardError => e
    p e
    return "Ocorreu um erro, seu email não pode ser entregue"
  end
end
