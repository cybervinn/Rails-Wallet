# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
  ['Jeremy', 'Raines', '404-272-1736', 'jraines@gmail.com', 'jeremy'],
  ['Jim', 'Baines', '404-272-1737', 'jbaines@example.com', 'jeremy'],
]

users.each do |fname, lname, phone, email, password|
  User.create fname: fname, lname: lname, phone: phone, email: email, password: password
end

cards = [
  ['4111111111111', 12, 2017],
  ['3111111111111', 12, 2017],
  ['5111111111111', 12, 2017],
]

jeremy = User.find_by_email('jraines@gmail.com')
jim    = User.find_by_email('jbaines@example.com')

cards.each do |n, m, y|
  c = Card.new number: n, expiration_month: m, expiration_year: y
  c.users << jeremy
  c.save
end


visa = Card.find_by_number('4111111111111')
amex = Card.find_by_number('3111111111111')
mc   = Card.find_by_number('5111111111111')

jim.cards << mc
jim.cards << visa
