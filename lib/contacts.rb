class Address
  attr_accessor(:street, :city, :state, :type)

  def initialize(street, city, state, type)
    self.street = street
    self.city = city
    self.state = state
    self.type = type
  end
end

class Phone
  attr_accessor(:number, :type)

  def initialize(number, type)
    self.number = number
    self.type = type
  end
end

class Email
  attr_accessor(:address, :type)

  def initialize(address, type)
    self.address = address
    self.type = type
  end
end

class Contact

  attr_accessor(:name)

  def initialize(name)
    self.name = name
    @addresses = []
    @phones = []
    @emails = []
  end

  def addresses
    @addresses
  end

  def add_address(address)
    @addresses.push(address)
  end

  def phones
    @phones
  end

  def add_phones(phone)
    @phones.push(phone)
  end

  def emails
    @emails
  end

  def add_email(email)
    @emails.push(email)
  end
end
