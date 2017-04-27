require "capybara/rspec"
require "./app"

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the contacts path", {:type => :feature}) do
  it("Create a new user and add an address to the user.") do
    visit("/")
    fill_in("name", :with => "John Doe")
    fill_in("street", :with => "123 Here Street")
    fill_in("city", :with => "Portland")
    fill_in("state", :with => "Oregon")
    fill_in("address-type", :with => "Home")
    click_button("Add Contact")
    expect(page).to have_content("John Doe")
    click_link('John Doe')
    expect(page).to have_content("John Doe")
    expect(page).to have_content("123 Here Street")
    Contact.empty_collection
  end

  it("Deletes a user.") do
    visit("/")
    fill_in("name", :with => "John Doe")
    fill_in("street", :with => "123 Here Street")
    fill_in("city", :with => "Portland")
    fill_in("state", :with => "Oregon")
    fill_in("address-type", :with => "Home")
    click_button("Add Contact")
    click_link('John Doe')
    click_link("Delete Contact")
    expect(page).to have_content("Contact Deleted")
    Contact.empty_collection
  end

  it("Adds an address to an existing contact.") do
    visit("/")
    fill_in("name", :with => "John Doe")
    fill_in("street", :with => "123 Here Street")
    fill_in("city", :with => "Portland")
    fill_in("state", :with => "Oregon")
    fill_in("address-type", :with => "Home")
    click_button("Add Contact")
    click_link('John Doe')
    fill_in("street", :with => "123 Here Street")
    fill_in("city", :with => "Portland")
    fill_in("state", :with => "Oregon")
    fill_in("address-type", :with => "Home")
    click_button("Add Address")
    expect(page).to have_content("Address Successfully Updated")
    Contact.empty_collection
  end

end
