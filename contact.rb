class Contact

  @@unique_id = 100
  @@contact_list = []

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @contact_id = (@@unique_id += 1)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
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
  def edit_first_name=(new_first_name)
    @first_name = new_first_name
  end

  def edit_last_name=(new_last_name)
    @last_name = new_last_name
  end

  def edit_email=(new_email)
    @email = new_email
  end

  def edit_note=(new_note)
    @note = new_note
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contact_list << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contact_list
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find
    contact = {}
    puts "Enter Contact ID"
    input_id = gets.to_i
    @@contact_list.each do |id|
      if input_id == id.contact_id
        contact = id
      end
    end
    puts contact
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def print_update
    puts "Attribute to Change"
    puts "[1]  First Name"
    puts "[2]  Last Name"
    puts "[3]  E-mail"
    puts "[4]  Note"
    puts "Enter a number"
  end

  def update
    print_update
    user_input = gets.to_i
    case user_input
    when 1
      puts "Enter First Name"
      new_first_name = gets.chomp
      @first_name = new_first_name
    when 2
      puts "Enter Last Name"
      new_last_name = gets.chomp
      @last_name = new_last_name
    when 3
      puts "Enter E-mail"
      new_email = gets.chomp
      @edit_email = new_email
    when 4
      puts "Enter Note"
      new_note = gets.chomp
      @edit_note = new_note
    else        exit
    end
    puts Contact.all
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(search_by)
    contact = {}
    case search_by
    when 1 then
      puts "Enter First Name"
      search_first_name = gets.chomp
      @@contact_list.each do |first_name|
        if search_first_name == first_name.first_name
          contact = first_name
        end
      end
    when 2 then
      puts "Enter Last Name"
      search_last_name = gets.chomp
      @@contact_list.each do |last_name|
        if search_last_name == last_name.last_name
          contact = last_name
        end
      end
    when 3 then
      puts "Enter Email"
      search_email = gets.chomp
      @@contact_list.each do |email|
        if search_email == email.email
          contact = email
        end
      end
      puts contact.inspect
    end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contact_list.clear
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete(user)
    @@contact_list.delete(user)
  end

  # Feel free to add other methods here, if you need them.

end
