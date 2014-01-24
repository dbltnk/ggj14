json.array!(@quests) do |quest|
  json.extract! quest, :name, :description, :imgurl
  json.url quest_url(quest, format: :json)
end