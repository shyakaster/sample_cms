class Subject < ActiveRecord::Base
  has_many :pages
  scope :visible, lambda{where(:visible=>true)}
  scope :invisible, lambda{where(:visible=>false)}
  scope :sorted, lambda{order("position ASC")}
  scope :newest_first, lambda{order("created_at DESC")}
  scope :position_sort, lambda{where("position > 1")}
  scope :search, lambda{|query|
                 where("subjects.name LIKE ?","%#{query}%")}
end
