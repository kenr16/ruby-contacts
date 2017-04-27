require 'sinatra'
require 'sinatra/reloader'
require './lib/contacts'
require 'pry'

enable :sessions

also_reload('lib/**/*.rb')

get('/') do
  @message = "You may add your contacts here!"
  erb(:index)
end

get('/add-contact') do
  @message = "You may add your contacts here!"
  name = params.fetch('name')
  street = params.fetch('street')
  city = params.fetch('city')
  state = params.fetch('state')
  address_type = params.fetch('address-type')
  phone = params.fetch('phone')
  phone_type = params.fetch('phone-type')
  email = params.fetch('email')
  email_type = params.fetch('email-type')
  new_contact = Contact.new(name)
  new_address = Address.new(street, city, state, address_type)
  new_phone = Phone.new(phone, phone_type)
  new_email = Email.new(email, email_type)
  new_contact.add_address(new_address)
  new_contact.add_phone(new_phone)
  new_contact.add_email(new_email)
  new_contact.save()
  erb(:index)
end

get("/contact-page/:id") do
  session[:contact_id] = params.fetch('id') #fetches the id directly from the url of the hyperlink
  @contact = Contact.find_contact(params.fetch('id'))
  @message = "#{@contact.name}"
  erb(:edit)
end

get("/edit-contact") do
  @message = "Address Successfully Updated"
  contact = Contact.find_contact(session[:contact_id])
  puts "******************************"
  puts session[:contact_id]
  street = params.fetch('street')
  city = params.fetch('city')
  state = params.fetch('state')
  address_type = params.fetch('address-type')
  new_address = Address.new(street, city, state, address_type)
  contact.add_address(new_address)
  erb(:index)
end

get("/edit-phone") do
  @message = "Phone Number Successfully Updated"
  contact = Contact.find_contact(session[:contact_id])
  phone = params.fetch('phone')
  phone_type = params.fetch('phone-type')
  new_phone = Phone.new(phone, phone_type)
  contact.add_phone(new_phone)
  erb(:index)
end
