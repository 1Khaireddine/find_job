class CreateUserDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :user_details do |t|
      t.string :languages, array: true, default: []
      t.string :skills, array: true, default: []
      t.integer :salary_min
      t.integer :salary_max
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
