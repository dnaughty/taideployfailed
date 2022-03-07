class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string :lessname
      t.string :lessnum
      t.string :lessfield
      t.string :startdate
      t.string :enddate
      t.string :starttime
      t.string :endtime
      t.references :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
