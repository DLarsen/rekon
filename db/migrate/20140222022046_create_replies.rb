class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :prompt_id
      t.text :answer

      t.timestamps
    end
  end
end
