# frozen_string_literal: true

module Spree
  module UserDecorator
    def self.prepended(base)
      base.has_one :pagarme_recipient, dependent: :destroy
      base.has_many :bank_accounts, dependent: :destroy
    end
  end
end

Spree::User.prepend Spree::UserDecorator
