class SectionEdit < ApplicationRecord

  belongs_to :editor, :class_name => "AdminUser", :foreign_key => "admin_user_id"
  belongs_to :section
  #validates :editor, length: { minimum: 1, message: "must have at least one editor assigned" }
  #validates :section, length: { minimum: 1, message: "must have at least one editor assigned" }

end
