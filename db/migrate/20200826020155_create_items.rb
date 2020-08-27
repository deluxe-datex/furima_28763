class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string :image,       null: false
      t.string :name,        null: false
      t.text :description,   null: false
      t.integer :category,   null: false
      t.integer :status,     null: false
      t.integer :burden,     null: false
      t.integer :prefecture, null: false
      t.integer :days,       null: false
      t.integer :price,      null: false
      t.references :user,    null: false, foreign_key: true
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :burden_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :day_id, null: false
      t.timestamps
    end
  end
end
