class AddRecipientIdToBankAccount < ActiveRecord::Migration[4.2]
  def change
    add_column :spree_bank_account, :recipient_id, :integer
    remove_column :spree_pagarme_recipients, :bank_account_id
  end
end
