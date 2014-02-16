class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.boolean :is_lead, default: false
      t.belongs_to :person
      t.belongs_to :project

      t.timestamps
    end
  end
end
