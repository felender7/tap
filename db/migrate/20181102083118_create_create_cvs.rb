class CreateCreateCvs < ActiveRecord::Migration[5.2]
  def change
    create_table :create_cvs do |t|
      t.string :id_number
      t.string :passport_number
      t.string :identification_type
      t.string :gender
      t.date   :date_of_birth
      t.string :place_of_birth
      t.string :disability
      t.string :education_type
      t.string :qualification_1
      t.string :qualification_2
      t.string :qualification_3

      t.timestamps
    end
  end
end
