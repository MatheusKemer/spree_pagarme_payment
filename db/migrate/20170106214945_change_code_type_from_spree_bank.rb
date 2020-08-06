class ChangeCodeTypeFromSpreeBank < ActiveRecord::Migration[4.2]
  def change
    change_column :spree_banks, :code, :string, :null => false
  end
end
