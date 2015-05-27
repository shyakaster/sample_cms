class Section < ActiveRecord::Base
  belongs_to :page
  has_many :section_edits
  has_many :editors, :through => :section_edits, :class_name=>"AdminUser"
  #validates_presence_of :name
  CONTENT_TYPES = ['text', 'HTML']

  validates_presence_of :name,
                        :length=>{:maximum=>255}
  #validates_length_of :name, :maximum => 255
  validates_inclusion_of :content_type, :in => CONTENT_TYPES,
                         :message => "must be one of: #{CONTENT_TYPES.join(', ')}"
  validates_presence_of :content
  scope :visible, lambda{where(:visible=>true)}
  scope :invisible, lambda{where(:visible=>false)}
  scope :sorted, lambda{order("sections.position ASC")}
  scope :newest_first, lambda{order("created_at DESC")}
  scope :search, lambda{|query|
                 where("subjects.name LIKE ?","%#{query}%")}
end
