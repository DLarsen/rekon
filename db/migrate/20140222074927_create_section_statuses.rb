class CreateSectionStatuses < ActiveRecord::Migration
  def change
    create_table :section_statuses do |t|
      t.integer :project_id
      t.integer :section_id
      t.integer :status_code

      t.timestamps
    end
  end
end
