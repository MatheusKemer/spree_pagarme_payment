class AddInfoToWithdrawalInfo < ActiveRecord::Migration[4.2]
  def change
  	add_column :spree_bank_account, :title, :string
  	add_column :spree_bank_account, :deleted_at, :datetime
  	add_column :spree_bank_account, :is_default, :boolean, :default => false
  end
end
