class Page < ApplicationRecord

  belongs_to :subject
  has_and_belongs_to_many :editors, :class_name => "AdminUser", dependent: :destroy
  has_many :sections, dependent: :destroy

  #validates :editors, length: { minimum: 1, message: "must have at least one editor assigned" }
  
  


  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  validates_presence_of :permalink
  validates_length_of :permalink, :within => 3..255
  # use presence_of with length_of to disallow spaces
  validates_uniqueness_of :permalink
  # for unique values by subject use ":scope => :subject_id"
  
  #belongs_to :subject, optional: true
  #validates :subject, absence: true
  # validates :name, uniqueness: { scope: :permalink,
  #   message: "should be unique for permalink" }
  # validates :permalink, inclusion: { in: %w(first second third),
  #   message: "%{value} is not a valid permalink" }
  # validates :permalink, exclusion: { in: %w(one two three),
  #   message: "%{value} is reserved." }
  
  scope :visible, lambda { where(:visible => true)} #standard lambda
  scope :invisible, -> { where(:visible => false)} #stabby lambda
  scope :sorted, lambda{ order("position ASC")}
  scope :newest_first, lambda{ order("pages.created_at DESC")}
  scope :search, lambda{ |query|
    where(["name LIKE ?", "%#{query}%"])
  }
  scope :recent, lambda{ where(:created_at => 1.week.ago..Time.now)}

end
