Admin.create!(email: 'foo@bar.com', password: 'qwerty123')

user = User.create!(first_name: 'Foo', last_name: 'Bar')
user.update(api_token: 'foobar')
