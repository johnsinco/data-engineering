class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :purchaser
      t.integer :quantity
      t.references :item, index: true

      t.timestamps
    end
  end
end
