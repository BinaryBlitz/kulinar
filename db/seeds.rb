Admin.create!(email: 'foo@bar.com', password: 'qwerty123')

user = User.create!(name: 'Foo', email: 'foo@bar.com', password: 'qwerty123')
user.update(api_token: 'foobar')

image = File.open(Rails.root.join('test', 'fixtures', 'files', 'blank.jpg'))

restaurant = Restaurant.create!(
  name: 'Restaurant', description: 'Description',
  image: image, icon: image,
  address: 'Address', phone_number: '+79998887766', site_url: 'http://google.com'
)

category = Category.create!(name: 'Category', image: image)

recipe = Recipe.create!(
  name: 'Recipe', description: 'Description', image: image,
  cooking_time: 60, calories: 1.0, proteins: 1.0, fats: 1.0,
  carbohydrates: 1.0, restaurant: restaurant, category: category
)
