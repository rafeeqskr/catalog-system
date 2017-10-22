class CreateSubProductTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :sub_product_types do |t|
      t.string :type_name
      t.references :product_type, foreign_key: true

      t.timestamps
    end
  end
end
