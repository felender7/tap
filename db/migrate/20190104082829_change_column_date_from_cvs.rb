class ChangeColumnDateFromCvs < ActiveRecord::Migration[5.2]
  def change
    change_column :cvs, :date_of_birth, :date
  end
end
