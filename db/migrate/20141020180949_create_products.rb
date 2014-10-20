class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :model
      t.string :image
      t.string :code
      t.text :url
      t.string :manufacturer

      t.timestamps
    end
  end
end
