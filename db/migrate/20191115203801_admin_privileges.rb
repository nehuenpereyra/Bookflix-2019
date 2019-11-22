class AdminPrivileges < ActiveRecord::Migration[6.0]
  def change
    add_column :administrators, :privileges, :integer
  end
end
