class RemoveClientIdFromVotes < ActiveRecord::Migration
  def change
    remove_column :votes, :client_id, :string
  end
end
