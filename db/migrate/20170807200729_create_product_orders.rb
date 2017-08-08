class CreateProductOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :product_orders do |t|
      t.belongs_to :product, null: false
      t.belongs_to :order, null: false
      t.string :quantity, null: false
    end
  end
end
