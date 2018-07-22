class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :first_name, :last_name, :email, :password, :null => false
      t.timestamps
    end
  end
end
