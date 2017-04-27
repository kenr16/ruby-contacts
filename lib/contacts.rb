class Address
  attr_accessor(:street, :city, :state)

  def initialize(street, city, state)
    self.street = street
    self.city = city
    self.state = state
  end
end
