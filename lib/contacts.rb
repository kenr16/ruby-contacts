class Address
  attr_accessor(:street, :city, :state)

  def initialize(street, city, state)
    self.street = street
    self.city = city
    self.state = state
  end

end

class Phone
  attr_accessor(:number, :type)

  def initialize(number, type)
    self.number = number
    self.type = type
  end
  
end
