class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.string :number
      t.float :total
      t.string :state

      t.timestamps
    end
  end
end
