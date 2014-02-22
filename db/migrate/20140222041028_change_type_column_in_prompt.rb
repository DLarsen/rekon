class ChangeTypeColumnInPrompt < ActiveRecord::Migration
  def change
    rename_column :prompts, :type, :type_of
  end
end
