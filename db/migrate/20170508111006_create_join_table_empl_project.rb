class CreateJoinTableEmplProject < ActiveRecord::Migration
  def change
    create_join_table :empls, :projects do |t|
       t.index [:empl_id, :project_id]
       t.index [:project_id, :empl_id]
    end
  end
end
