class AddProjectToReply < ActiveRecord::Migration
  def change
    add_column :replies, :project_id, :integer
  end
end
