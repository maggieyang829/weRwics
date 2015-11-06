# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:'Maggie', email:'maggie@yang.com', state:'Iowa', city: 'Iowa City', profession:'Student', description:'Hi, I am Maggie!')
User.create!(name:'Sushma', email:'sushma@sushma.com', state:'Iowa', city: 'Iowa City', profession:'Student', description:'Hi, I am Sushma!')
User.create!(name:'Anu', email:'anu@anu.com', state:'Michigan', city: 'Milwaki', profession:'Student', description:'Hi, I am Anu!')
User.create!(name:'Jingwei', email:'jingwei@ji.com', state:'New York', city: 'New York City', profession:'Student', description:'Hi, I am Jingwei. I am a boy!')
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')