class AlterSubjects < ActiveRecord::Migration
  def up
    puts "======changing column visible on subjects table to default to false========"
    change_column("subjects","visible",:boolean,:default=>false)
  end
  def down

  end
end
