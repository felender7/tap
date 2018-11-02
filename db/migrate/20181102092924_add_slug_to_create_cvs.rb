class AddSlugToCreateCvs < ActiveRecord::Migration[5.2]
  def change
    add_column :create_cvs, :slug, :string
    add_index :create_cvs, :slug, unique: true
  end
end
