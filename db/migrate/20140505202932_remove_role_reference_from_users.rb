class RemoveRoleReferenceFromUsers < ActiveRecord::Migration
  def change
    remove_reference :users, :role
  end
end
