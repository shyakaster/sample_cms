class CreateSubjects < ActiveRecord::Migration
  def up
    create_table :subjects do |t|
       t.string "name", :limit=>25
       t.integer "position"
       t.boolean "visible"
       t.timestamps null: false

    end
  end
  def down
    drop_table :subjects
  end
end
