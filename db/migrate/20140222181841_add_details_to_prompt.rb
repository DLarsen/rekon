class AddDetailsToPrompt < ActiveRecord::Migration
  def change
    add_column :prompts, :details, :text
  end
end
