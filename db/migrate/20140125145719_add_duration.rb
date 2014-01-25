class AddDuration < ActiveRecord::Migration
  def change
	add_column :quests, :duration, :string
  end
end
