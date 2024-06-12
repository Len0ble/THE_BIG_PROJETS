class CreatePotins < ActiveRecord::Migration[6.1]
  def change
    create_table :potins do |t|
      t.string :author
      t.text :content

      t.timestamps
    end
  end
end
