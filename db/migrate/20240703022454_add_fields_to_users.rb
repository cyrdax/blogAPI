class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :picture, :string
    add_column :users, :bio, :text
  end
end
