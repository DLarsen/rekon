class AddSlugToPrompt < ActiveRecord::Migration
  def change
    add_column :prompts, :slug, :string
  end
end
