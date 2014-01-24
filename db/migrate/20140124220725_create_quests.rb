class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.string :name
      t.string :description
      t.string :imgurl

      t.timestamps
    end
  end
end
