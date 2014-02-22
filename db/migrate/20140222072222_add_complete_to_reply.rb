class AddCompleteToReply < ActiveRecord::Migration
  def change
    add_column :replies, :complete?, :boolean
  end
end
