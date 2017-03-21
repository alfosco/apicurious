class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :username
      t.string :token
      t.string :email
      t.string :provider
      t.string :image

      t.timestamps null: false
    end
  end
end
