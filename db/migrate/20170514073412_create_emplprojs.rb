class CreateEmplprojs < ActiveRecord::Migration
  def change
    create_table :emplprojs do |t|
      t.references :empl, index: true, foreign_key: true, null: false
      t.references :project, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
