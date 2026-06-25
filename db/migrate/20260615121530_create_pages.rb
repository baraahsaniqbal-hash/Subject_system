class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.references :subject, null: false, foreign_key: true
      # same as: t.references :subjects, null: false, foreign_key: true
      t.string "name"
      t.string "permalink"
      t.integer "position"
      t.boolean "visible", :default => false
      t.timestamps
    end
    add_index :pages, :permalink
  end
end
