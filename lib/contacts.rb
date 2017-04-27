require('uuid')

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
  @@contacts = []

  attr_accessor(:name, :id)

  def initialize(name)
    self.name = name
    self.id = UUID.new.generate
    @addresses = []
    @phones = []
    @emails = []
  end

  def self.empty_collection
    @@contacts = []
  end

  def self.delete_contact(id)
    @@contacts.delete(self.find_contact(id))
  end

  def self.find_contact(id)
    @@contacts.find {|contact| contact.id == id}
  end

  def addresses
    @addresses
  end

  def add_address(address)
    @addresses.push(address) unless address.street.empty? || address.city.empty? || address.state.empty? || address.type.empty?
  end

  def phones
    @phones
  end

  def add_phone(phone)
    @phones.push(phone)
  end

  def emails
    @emails
  end

  def add_email(email)
    @emails.push(email)
  end

  define_method(:save) do
    @@contacts.push(self) unless self.name.empty?
  end

  def self.all
    @@contacts
  end

end
