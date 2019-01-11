class Products < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :reporting_name
      t.timestamps
    end
  end
end
