class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.references :shop, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.float :price

      t.timestamps
    end
  end
end
