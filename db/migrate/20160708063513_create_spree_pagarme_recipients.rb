class CreateSpreePagarmeRecipients < ActiveRecord::Migration[4.2]
  def change
    create_table :spree_pagarme_recipients do |t|
    	t.integer :user_id
    	t.string  :pagarme_id
    	t.string  :recipient_type, :default => 'consignment'
    end
    add_column :spree_products, :recipient_id, :string
  end
end
