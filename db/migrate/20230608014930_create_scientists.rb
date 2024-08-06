class CreateScientists < ActiveRecord::Migration[7.0]
  def change
    create_table :scientists do |t|
      t.string :name
      t.string :specialty
      t.string :university
      t.references :lab, null: false, foreign_key: true

      t.timestamps
    end
  end
end
