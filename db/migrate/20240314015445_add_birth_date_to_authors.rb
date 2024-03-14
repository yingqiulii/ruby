class AddBirthDateToAuthors < ActiveRecord::Migration[7.1]
  def change
    add_column :authors, :birth_date, :date
  end
end
