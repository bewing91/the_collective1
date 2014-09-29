class AddMediaAttributesToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :content_type, :string
    add_column :projects, :file_size, :string
  end
end
