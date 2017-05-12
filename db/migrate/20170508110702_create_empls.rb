class CreateEmpls < ActiveRecord::Migration
  def change
    create_table :empls do |t|
      t.string :last_name, limit: 20, null: false
      t.string :first_name, limit: 10, null: false
      t.string :second_name, limit: 20, null: false
      t.date :birthday,  null: false
      t.string :passport, limit: 10, null: false
      t.string :inn, limit: 7, null: false
      t.string :post, limit: 25, null: false
      t.references :depart, index: true, foreign_key: true, null: false
      t.index [:inn], unique: true
      t.index [:passport], unique: true

      t.timestamps null: false
    end
  end
end
