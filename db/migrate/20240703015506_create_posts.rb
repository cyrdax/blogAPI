class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :subject
      t.text :post_text
      t.string :picture
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
