class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :title
      t.string :subtitle
      t.string :code, "char(6)"

      t.timestamps
    end
  end
end
