class AddAllowOtherToPrompt < ActiveRecord::Migration
  def change
    add_column :prompts, :allow_other, :boolean, :default => true
  end
end
