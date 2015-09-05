class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
  	# adding a index into the email column in the users table.
  	 #index on the email attribute fixes a pontetial effiency problem by preventing a full-table scan
  	 # when finding users by email.
  	add_index :users, :email, unique: true
  end
end
