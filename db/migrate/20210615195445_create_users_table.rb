class CreateUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :api_key
    end

    def change
      add_column :users, :id, :primary_key
    end
  end
end
