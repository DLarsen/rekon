class AddHintToPrompt < ActiveRecord::Migration
  def change
    add_column :prompts, :hint, :text
  end
end
