class AddCountryToPublishers < ActiveRecord::Migration[7.1]
  def change
    add_column :publishers, :country, :string
  end
end
