class CreateProduct < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.belongs_to :grower, class_name: "User", null: false
      t.string :name, null: false
      t.string :price, null: false
      t.string :unit, null: false
    end
  end
end
