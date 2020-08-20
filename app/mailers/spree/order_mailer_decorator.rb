# frozen_string_literal: true

module Spree
  module OrderMailerDecorator
    def pagarme_error_notification(subject, message)
      mail(to: ENV['ADMIN_EMAILS'].split(','), subject: subject, body: message)
    end
  end
end

Spree::OrderMailer.prepend Spree::OrderMailerDecorator
