require "contacts"
require "rspec"
require "pry"

describe 'Address' do
  describe("#add_address") do
    it "Adds an address to the list" do
      test_address = Address.new("123 Street", "Portland", "Oregon")
      expect(test_address.street).to eq("123 Street")
    end
  end
end
