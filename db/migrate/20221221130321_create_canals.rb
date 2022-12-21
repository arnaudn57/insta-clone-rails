class CreateCanals < ActiveRecord::Migration[7.0]
  def change
    create_table :canals do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :other_user

      t.timestamps
    end
  end
end
