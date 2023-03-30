class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :status, default: 0
      t.float :total_cost, default: 0.0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
