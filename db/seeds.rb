Admin.create!(email: 'foo@bar.com', password: 'qwerty123')

user = User.create!(name: 'Foo', email: 'foo@bar.com', password: 'qwerty123')
user.update(api_token: 'foobar')

image = File.open(Rails.root.join('test', 'fixtures', 'files', 'blank.jpg'))

restaurant = Restaurant.create!(
  name: 'Restaurant', description: 'Description',
  image: image, icon: image,
  address: 'Address', phone_number: '+79998887766', site_url: 'http://google.com'
)
