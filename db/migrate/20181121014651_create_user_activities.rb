class CreateUserActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :user_activities do |t|
      t.belongs_to :user
      t.belongs_to :activity

      t.timestamps
    end
  end
end
