class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :state
      t.string :profession
      t.text :description

      t.timestamps null: false
    end
  end
end
