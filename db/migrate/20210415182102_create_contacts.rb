class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.references :user_id, foreign_key: true
      t.string :email
      t.text :text

      t.timestamps
    end
  end
end
