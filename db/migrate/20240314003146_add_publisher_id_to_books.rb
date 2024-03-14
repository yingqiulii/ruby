class AddPublisherIdToBooks < ActiveRecord::Migration[7.1]
  def change
    add_reference :books, :publisher, null: false, foreign_key: true
  end
end
