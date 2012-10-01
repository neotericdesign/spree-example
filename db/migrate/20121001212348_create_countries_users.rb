class CreateCountriesUsers < ActiveRecord::Migration
  def change
    create_table :countries_users do |t|
      t.references :country
      t.references :user

      t.timestamps
    end
    add_index :countries_users, :country_id
    add_index :countries_users, :user_id
  end
end
