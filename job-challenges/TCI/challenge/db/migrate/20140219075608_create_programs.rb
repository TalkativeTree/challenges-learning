class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :title
      t.string :subtitle
      t.column :code, "char(6)"

      t.timestamps
    end
  end
end
