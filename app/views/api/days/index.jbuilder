json.array! @days do |day|
  json.partial! 'api/days/day', day: day

  json.recipe do
    json.partial! 'api/recipes/recipe', recipe: day.recipe
  end
end
