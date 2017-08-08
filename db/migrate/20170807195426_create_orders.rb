class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.belongs_to :user, null: false
      t.belongs_to :event, null: false
      t.string :email, null: false
      t.string :name, null: false
    end
  end
end
