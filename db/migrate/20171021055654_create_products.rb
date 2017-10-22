class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :qty
      t.references :maker, foreign_key: true
      t.string :color
      t.string :code
      t.references :sub_product_type, foreign_key: true
      t.boolean :on_homepage

      t.timestamps
    end
  end
end
