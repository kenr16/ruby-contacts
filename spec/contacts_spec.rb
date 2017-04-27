require "organizer"
require "rspec"
require "pry"

describe 'Address' do
  describe("#add_address") do
    it "Adds an address to the list" do
      love = CD.new("Love", "Lana Del Rey")
      collection.add_cd(love)
      expect(Collection.all_cds).to eq [love]
    end
  end
