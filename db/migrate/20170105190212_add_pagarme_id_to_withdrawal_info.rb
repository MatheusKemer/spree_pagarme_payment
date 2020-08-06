class AddPagarmeIdToWithdrawalInfo < ActiveRecord::Migration[4.2]
  def change
    add_column :spree_withdrawal_infos, :pagarme_id, :integer
  end
end
