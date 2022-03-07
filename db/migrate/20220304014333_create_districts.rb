class CreateDistricts < ActiveRecord::Migration[6.0]
  def change
    create_table :districts do |t|
      t.string :dname
      t.string :dcity
      t.string :dcounty
      t.string :dstate
      t.string :dcountry

      t.timestamps
    end
  end
end
