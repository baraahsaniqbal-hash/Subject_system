class CreateAdminUsersPagesJoin < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_users_pages, :id => false do |t|
      t.references :admin_user, null: false, foreign_key: true
      t.references :page, null: false, foreign_key: true
      t.timestamps
    end
      add_index :admin_users_pages, [:admin_user_id, :page_id]
  end
end
