class Subject < ActiveRecord::Base
  has_many :pages
  validates_presence_of :name,
                        :length=>{:maximum=>255}

  #validates_length_of :name,:maximum => 255
  scope :visible, lambda{where(:visible=>true)}
  scope :invisible, lambda{where(:visible=>false)}
  scope :sorted, lambda{order("position ASC")}
  scope :newest_first, lambda{order("created_at DESC")}
  scope :search, lambda{|query|
                 where("subjects.name LIKE ?","%#{query}%")}
end
