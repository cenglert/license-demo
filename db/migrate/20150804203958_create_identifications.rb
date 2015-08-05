class CreateIdentifications < ActiveRecord::Migration
  def change
    create_table :identifications do |t|
      t.integer :user_id
      t.string :license_number

      t.timestamps null: false
    end
  end
end
