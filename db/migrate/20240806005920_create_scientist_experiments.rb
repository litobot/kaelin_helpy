class CreateScientistExperiments < ActiveRecord::Migration[7.1]
  def change
    create_table :scientist_experiments do |t|
      t.references :scientist, null: false, foreign_key: true
      t.references :experiment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
