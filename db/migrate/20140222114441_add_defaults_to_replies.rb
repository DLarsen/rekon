class AddDefaultsToReplies < ActiveRecord::Migration
  def change
    change_column :replies, :skipped, :boolean, :default => false
    change_column :replies, :not_applicable, :boolean, :default => false
  end
end
