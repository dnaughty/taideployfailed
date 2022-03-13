class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.string :firstn
      t.string :lastn
      t.string :teachnum
      t.references :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
