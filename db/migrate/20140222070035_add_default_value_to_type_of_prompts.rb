class AddDefaultValueToTypeOfPrompts < ActiveRecord::Migration
  def change
    change_column :prompts, :type_of, :string, :default => "text"
  end
end
