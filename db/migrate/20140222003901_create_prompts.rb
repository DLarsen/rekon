class CreatePrompts < ActiveRecord::Migration
  def change
    create_table :prompts do |t|
      t.integer :section_id
      t.integer :sequence
      t.string :type, limit: 32
      t.text :instructions
      t.text :suggested_answers
      t.boolean :multi_response?
      t.text :dependencies

      t.timestamps
    end
  end
end
