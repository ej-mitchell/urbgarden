class CreateUserEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :user_events do |t|
      t.belongs_to :grower, class_name: "User", null: false
      t.belongs_to :event, null: false
    end
  end
end
