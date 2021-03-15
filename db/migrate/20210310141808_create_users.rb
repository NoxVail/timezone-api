class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :token
      t.text   :timezones, array: true, default: []

      t.timestamps
    end
  end
end
