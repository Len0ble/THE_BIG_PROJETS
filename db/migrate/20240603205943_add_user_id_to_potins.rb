class AddUserIdToPotins < ActiveRecord::Migration[6.1]
  def change
    add_reference :potins, :user, null: false, foreign_key: true
  end
end
