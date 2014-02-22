class AddSkippedAndNaToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :skipped, :boolean
    add_column :replies, :not_applicable, :boolean
    rename_column :replies, :complete?, :complete
  end
end
