require "contacts"
require "rspec"
require "pry"

describe 'Address' do
  describe("#initialize") do
    it "Adds an initial address to the list" do
      test_address = Address.new("123 Street", "Portland", "Oregon")
      expect(test_address.street).to eq("123 Street")
    end
  end
end

describe 'Phone' do
  describe("#initialize") do
    it "Adds an intitial number to the list" do
      test_phone = Phone.new("808-937-8894", "home")
      expect(test_phone.number).to eq("808-937-8894")
    end
  end
end
