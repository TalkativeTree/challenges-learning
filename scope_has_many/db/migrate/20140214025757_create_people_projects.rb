class CreatePeopleProjects < ActiveRecord::Migration
  def change
    create_table :people_projects do |t|
      t.boolean :is_lead, default: false
      t.belongs_to :person
      t.belongs_to :project

      t.timestamps
    end
  end
end
