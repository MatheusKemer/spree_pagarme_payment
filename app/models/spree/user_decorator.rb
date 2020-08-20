# frozen_string_literal: true

module Spree
  module UserDecorator
    has_one :pagarme_recipient, dependent: :destroy
    has_many :bank_accounts, dependent: :destroy
  end
end

Spree::User.prepend Spree::UserDecorator
