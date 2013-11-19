class AddClientIdToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :client_id, :string
  end
end
