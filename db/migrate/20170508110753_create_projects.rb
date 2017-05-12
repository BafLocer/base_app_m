class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :p_name, limit: 25, null: false
      t.integer :cost, null:false
      t.date :time_start, null:false
      t.date :time_finish, null:false

      t.timestamps null: false
    end
  end
end
