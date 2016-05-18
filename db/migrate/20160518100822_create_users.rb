class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :address1
      t.string :address2
      t.string :state
      t.string :city
      t.string :zipcode

      t.timestamps null: false
    end
  end
end
