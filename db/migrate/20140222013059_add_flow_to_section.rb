class AddFlowToSection < ActiveRecord::Migration
  def change
    add_column :sections, :flow_id, :integer
  end
end
