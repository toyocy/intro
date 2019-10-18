class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :last_name
      t.string :first_name
      t.string :email, null: false, unique: true
      t.boolean :is_active, default: true
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
