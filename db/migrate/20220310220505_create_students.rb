class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :lastname
      t.string :firstname
      t.string :middlename
      t.string :dob
      t.string :street
      t.string :city
      t.string :zip
      t.string :pronouns
      t.string :gender
      t.references :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
