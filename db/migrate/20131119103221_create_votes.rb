class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :article

      t.timestamps
    end
  end
end
