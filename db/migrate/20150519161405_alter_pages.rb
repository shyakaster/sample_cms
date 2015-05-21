class AlterPages < ActiveRecord::Migration
  def up
    # add_index("pages","subject_id")
    # add_index("pages","permalink")
    puts "======changing column visible on subjects table to default to false========"
    change_column("pages","visible",:boolean,:default=>false)
    #change_column("pages","permalink",:string)
  end
  def down
    # remove_index("pages","subject_id")
    # remove_index("pages","permalink")
    change_column("pages","visible",:boolean)
  end
end
