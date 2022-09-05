class CreateJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :groups, :performances do |t|
      t.index [:group_id, :performance_id]
      t.index [:performance_id, :group_id]
    end
  end
end
