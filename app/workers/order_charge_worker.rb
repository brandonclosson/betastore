class OrderChargeWorker
  include Sidekiq::Worker

  def logger
    Rails.logger
  end

  def perform(order_id)
    order = Order.find(order_id)

    result = Braintree::Transaction.sale(
      :amount => order.total_amount,
      :credit_card => {
        :number => order.credit_card.card_number,
        :expiration_month => order.credit_card.expiration_month,
        :expiration_year => order.credit_card.expiration_year
      }
    )

    if result.success?
      logger.info "Transaction ID: #{result.transaction.id}"
      # status will be authorized or submitted_for_settlement
      logger.info "Transaction Status: #{result.transaction.status}"
    else
      logger.error "Message: #{result.message}"
      if result.transaction.nil?
        # validation errors prevented transaction from being created
        logger.error "Errors: #{result.errors.inspect}"
      else
        logger.error "Transaction ID: #{result.transaction.id}"
        # status will be processor_declined, gateway_rejected, or failed
        logger.error "Transaction Status: #{result.transaction.status}"
      end
    end
  end
end