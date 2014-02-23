class AddSequenceToSection < ActiveRecord::Migration
  def change
    add_column :sections, :sequence, :integer
  end
end
