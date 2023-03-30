class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :desc
      t.string :image
      t.float :cost
      t.integer :qty

      t.timestamps
    end
  end
end
