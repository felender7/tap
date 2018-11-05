class AddEthnicityToCreateCvs < ActiveRecord::Migration[5.2]
  def change
    add_column :create_cvs, :ethnicity, :string
  end
end
