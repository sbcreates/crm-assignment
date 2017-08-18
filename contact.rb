class Contact

  @@unique_id_gererator = 100

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @contact_id = (@@unique_id_gererator += 1)
    @first_name - first_name
    @last_name - last_name
    @email - email
    @note - note
  end

  #READERS
  def contact_id
    @contact_id
  end

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def email
    @email
  end

  def note
    @note
  end

  #WRITERS
  def first_name=(new_first_name)
    @first_name = new_first_name
  end

  def last_name=(new_last_name)
    @last_name = new_last_name
  end

  def email=(new_email)
    @email = new_email
  end

  def note=(new_note)
    @note = new_note
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create

  end

  # This method should return all of the existing contacts
  def self.all

  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find

  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update

  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by

  end

  # This method should delete all of the contacts
  def self.delete_all

  end

  def full_name

  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete

  end

  # Feel free to add other methods here, if you need them.

end
