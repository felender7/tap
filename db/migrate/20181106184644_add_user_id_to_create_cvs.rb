class AddUserIdToCreateCvs < ActiveRecord::Migration[5.2]
  def change
    add_column :create_cvs, :user_id, :integer
    add_index :create_cvs, :user_id
  end
end
