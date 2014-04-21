class SetDefaultValueForRoleInUsers < ActiveRecord::Migration
  def up
  	change_column_default :users, :role, 'Role::Guest'
  end

  def down
  	change_column_default :users, :role, nil
  end
end
