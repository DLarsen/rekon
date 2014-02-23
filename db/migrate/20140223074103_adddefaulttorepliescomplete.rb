class Adddefaulttorepliescomplete < ActiveRecord::Migration
  def change
    change_column :replies, :complete, :boolean, :default => false
  end
end
