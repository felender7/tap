class AddIdPassportToCreateCvs < ActiveRecord::Migration[5.2]
  def change
    add_column :create_cvs, :id_passport, :string
    add_index :create_cvs, :id_passport, unique: true
  end
end
