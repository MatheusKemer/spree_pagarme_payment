class RemoveWithdrawalInfoFromProducts < ActiveRecord::Migration[4.2]
  def change
    remove_column :spree_products, :recipient_id
  end
end
