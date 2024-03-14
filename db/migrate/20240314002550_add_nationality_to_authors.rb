class AddNationalityToAuthors < ActiveRecord::Migration[7.1]
  def change
    add_column :authors, :nationality, :string
  end
end
