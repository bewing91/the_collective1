class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.text :description
      t.string :media
      t.integer :user_id

      t.timestamps
    end
    add_index :projects, [:user_id, :updated_at]
  end
end
