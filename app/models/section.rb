class Section < ApplicationRecord

  has_many :section_edits, dependent: :destroy
  has_many :editors, :through => :section_edits, :class_name => "AdminUser", :foreign_key =>"admin_user_id", dependent: :destroy
  belongs_to :page

  CONTENT_TYPES = ['text', 'HTML']

  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  validates_inclusion_of :content_type, :in => CONTENT_TYPES,
    :message => "must be one of: #{CONTENT_TYPES.join(', ')}"
  validates_presence_of :content
  
end
