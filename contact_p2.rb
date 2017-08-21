class Contact < ActiveRecord::Base

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @contact_id = (@@unique_id += 1)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
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
  def self.find(input_id)
    @@contact_list.each do |id|
      if input_id == id.contact_id
        p id.full_name
      end
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def print_update
    p "Attribute to Change"
    p "[1]  First Name"
    p "[2]  Last Name"
    p "[3]  E-mail"
    p "[4]  Note"
    p "Enter a number"
  end

  def update
    print_update
    user_input = gets.to_i
    case user_input
    when 1
      puts "Enter First Name"
      new_first_name = gets.chomp
      edit_first_name=(new_first_name)
    when 2
      puts "Enter Last Name"
      new_last_name = gets.chomp
      edit_last_name=(new_last_name)
    when 3
      puts "Enter E-mail"
      new_email = gets.chomp
      edit_email=(new_email)
    when 4
      puts "Enter Note"
      new_note = gets.chomp
      edit_note=(new_note)
    else        exit
    end
    p Contact.all
  end

  def print_find_by
    p "Search by Attribue"
    p "[1]  First Name"
    p "[2]  Last Name"
    p "[3]  E-mail"
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by
    print_find_by
    user_input = gets.to_i
    case user_input
    when 1
      p "Enter First Name"
      search_first_name = gets.chomp
    when 2
      p "Enter Last Name"

    when 3
      p "Enter Email"
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
  def delete
    @@contact_list.delete(user)
  end

  # Feel free to add other methods here, if you need them.

end
