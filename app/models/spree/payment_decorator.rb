# frozen_string_literal: true

module Spree
  module PaymentDecorator
    # attr_accessible :pagarme_payment_attributes
    def self.prepended(base)
      base.has_one :pagarme_payment
      base.accepts_nested_attributes_for :pagarme_payment
    end

    def get_new_state
      if pagarme_payment
        pagarme_payment.update_state
        update_state
      end
    end

    def update_state
      pp = pagarme_payment
      case pp.state
      when 'processing'
        started_processing if state != 'processing'
      when 'authorized', 'paid'
        if state != 'completed'
          complete
          Spree::OrderMailer.payment_confirmation_email(order).deliver
        end
      when 'refunded'
        complete if can_complete?
      when 'pending_refund'
        complete if can_complete?
      when 'waiting_payment'
        pend if can_pend?
      when 'refused'
        failure if can_failure?
        transaction = pp.transaction
        message =  "Pagamento (#{id}) do Pedido (#{order.number}) recusado. \n"
        message += "Reason: #{transaction.status_reason} \n" if transaction
        Spree::OrderMailer.pagseguro_error_notification('Pagar.me - Payment Refused', message).deliver
        if pp.payment&.order
          Spree::OrderMailer.payment_refused_email(pp.payment.order).deliver
        end
      end
    end
  end
end

Spree::Payment.prepend Spree::PaymentDecorator
