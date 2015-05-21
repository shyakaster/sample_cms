class AlterSections < ActiveRecord::Migration
  def up
    puts "=======adding index on page_id on sections table======="
    add_index("sections","page_id")
    #puts "=====changing column on sections table to default to false"
    #change_column("sections","visible",:boolean,:default=>false)
  end
  def down
    remove_index("sections","page_id")

  end
end
