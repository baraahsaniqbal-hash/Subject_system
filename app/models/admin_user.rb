class AdminUser < ApplicationRecord

  # TO CONFIGURE  a different table name
  # self.table_name = "admin_users"
  
  has_secure_password

  has_and_belongs_to_many :pages, dependent: :destroy
  has_many :section_edits, dependent: :destroy
  has_many :section, :through => :section_edits, dependent: :destroy

  #validates :email, confirmation: true
  #validates :email, confirmation: { case_sensitive: false }
  #validates :email_confirmation, presence: true, if: :email_changed?


  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  validates_presence_of :first_name
  validates_length_of :first_name, :maximum => 25
  validates_presence_of :last_name
  validates_length_of :last_name, :maximum => 50
  validates_presence_of :username
  validates_length_of :username, :within => 8..25
  validates_uniqueness_of :username
  validates_presence_of :email
  validates_length_of :email, :maximum => 100
  validates_format_of :email, :with => EMAIL_REGEX
  validates :email, confirmation: true
  validates :email_confirmation, presence: true

  # shortcut validations
  # validates :first_name,:presence => true,
  #                       :length => { :maximum => 25 }
  # validates :last_name, :presence => true,
  #                       :length => { :maximum => 50 }
  # validates :username,  :length => { :within => 8..25 },
  #                       :uniqueness => true
  # validates :email,     :presence => true,
  #                       :length => { :maximum => 100 },
  #                       :format => { :with => EMAIL_REGEX },
  #                       :confirmation => true

  scope :sorted, lambda { order("last_name ASC, first_name ASC") }

  def name
    "#{first_name} #{last_name}"
  end
  
end
