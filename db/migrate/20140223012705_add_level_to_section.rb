class AddLevelToSection < ActiveRecord::Migration
  def change
    add_column :sections, :level, :integer
  end
end
