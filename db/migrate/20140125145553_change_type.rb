class ChangeType < ActiveRecord::Migration
  def change
	change_column :quests, :description, :text
  end
end
