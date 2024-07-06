class CreateLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :links do |t|
      t.string :link_name
      t.string :link_url
      t.string :picture
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
