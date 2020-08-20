# frozen_string_literal: true

module Spree
  module LineItemDecorator
    def self.prioritize_for_split
      # order(:price)
    end

    def split_rule
      # TODO: para usar o Split, personalize esse método para retornar um objeto (siga o modelo abaixo:)
      # return {
      #     :recipient => Spree::PagarmeRecipient.master_recipient,
      #     :value => product.price
      # }

      nil
    end
  end
end

Spree::LineItem.prepend Spree::LineItemDecorator
