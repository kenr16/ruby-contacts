require "contacts"
require "rspec"
require "pry"

describe 'Address' do
  describe("#initialize") do
    it "Adds an initial address to the list" do
      test_address = Address.new("123 Street", "Portland", "Oregon", "Home")
      expect(test_address.street).to eq("123 Street")
    end
  end
end

describe 'Phone' do
  describe("#initialize") do
    it "Adds an intitial number to the list" do
      test_phone = Phone.new("808-937-8894", "Home")
      expect(test_phone.number).to eq("808-937-8894")
    end
  end
end

describe 'Email' do
  describe("#initialize") do
    it "Adds an intitial email to the list" do
      test_email = Email.new("test_address@gmail.com", "Home")
      expect(test_email.address).to eq("test_address@gmail.com")
    end
  end
end

describe 'Contact' do
  describe("#initialize") do
    it "Adds an inital name to the contact list" do
      test_contact = Contact.new("John Doe")
      expect(test_contact.name).to eq("John Doe")
    end
  end

  describe("#add_phone") do
    it "Adds the a new phone object to the phones array" do
      test_contact = Contact.new("John Doe")
      test_phone = Phone.new("808-937-8894", "Home")
      test_contact.add_phones(test_phone)
      expect(test_contact.phones).to eq([test_phone])
    end
  end

  describe("#add_address") do
    it "Adds the a new address object to the addresses array" do
      test_contact = Contact.new("John Doe")
      test_address = Address.new("123 Street", "Portland", "Oregon", "Home")
      test_contact.add_address(test_address)
      expect(test_contact.addresses).to eq([test_address])
    end
  end

  describe("#add_email") do
    it "Adds the a new email object to the emails array" do
      test_contact = Contact.new("John Doe")
      test_email = Email.new("test_address@gmail.com", "Home")
      test_contact.add_email(test_email)
      expect(test_contact.emails).to eq([test_email])
    end
  end


end
