class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :prenom
      t.string :nom
      t.text :description
      t.string :email
      t.integer :age
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
