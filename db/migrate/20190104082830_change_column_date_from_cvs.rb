class ChangeColumnDateFromCvs < ActiveRecord::Migration[5.2]
  def change
    change_column :cvs, :date_of_birth, 'datetime USING CAST(date_of_birth AS datetime)'
  end
end
