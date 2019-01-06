class ChangeColumnDateFromCvs < ActiveRecord::Migration[5.2]
  def change
    change_column :cvs, :date_of_birth, 'date USING CAST(column_name AS integer)'
  end
end
