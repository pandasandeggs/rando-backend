class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.user :belongs_to
      t.friend :belongs_to

      t.timestamps
    end
  end
end
