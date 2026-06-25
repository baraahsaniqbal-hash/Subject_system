class CreateSectionEdits < ActiveRecord::Migration[6.1]
  def change
    create_table :section_edits do |t|
      t.references :admin_user, null: false, foreign_key: true
      t.references :section, null: false, foreign_key: true
      t.string :summary
      t.timestamps
    end
  end
end
