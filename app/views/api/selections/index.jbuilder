json.array! @selections do |selection|
  json.partial! 'api/selections/selection', selection: selection

  json.recipes selection.recipes do |recipe|
    json.partial! 'api/recipes/recipe', recipe: recipe
  end
end
