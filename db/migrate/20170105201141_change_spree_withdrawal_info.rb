class ChangeSpreeWithdrawalInfo < ActiveRecord::Migration[4.2]
  def change
    rename_table :spree_withdrawal_infos, :spree_bank_account
  end
end
