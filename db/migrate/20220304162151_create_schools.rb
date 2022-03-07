class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :sname
      t.string :street
      t.string :stown
      t.string :sstate
      t.string :szip
      t.references :district, null: false, foreign_key: true

      t.timestamps
    end
  end
end
