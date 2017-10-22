class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.references :product, foreign_key: true
      t.boolean :main_image
      t.string :image_uid

      t.timestamps
    end
  end
end
