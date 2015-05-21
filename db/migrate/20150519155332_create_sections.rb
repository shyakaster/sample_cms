class CreateSections < ActiveRecord::Migration
  def up
    create_table :sections do |t|
       t.integer "page_id"
       t.string "name"
       t.integer "position"
       t.boolean "visible"
       t.string "content_type"
       t.text "content"
       t.timestamps null: false


    end
  end

  def down
    drop_table :sections
  end
end
