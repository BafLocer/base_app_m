class CreateDeparts < ActiveRecord::Migration
  def change
    create_table :departs do |t|
      t.text :d_name, null: false

      t.timestamps null: false
    end
  end
end
