require 'pry'
require_relative('contact_p2.rb')

class CRM

#need to create a unique ID for each user as they're created.


#When CRM initiated, should take user to a main menu.
  def initialize
    main_menu
  end

#Want to print the main menu and tell the crm what to do depending on user selection.
  def main_menu
    while true
      print_main_menu
      user_menu_input = gets.to_i
      call_option(user_menu_input)
    end
  end

#Print out the options for the user to choose from in main menu.
  def print_main_menu
    puts "Main Menu"
    puts "*-------*"
    puts "[1]  Add New Contact"
    puts "[2]  Modify Contact"
    puts "[3]  Delete Contact"
    puts "[4]  Display All Contacts"
    puts "[5]  Search by Attribute"
    puts "[6]  Exit"
    puts "Enter a number"
  end

  def call_option(user_menu_input)
    case user_menu_input
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    else        exit
    end
  end

  def add_new_contact
    puts "Contact's first name?"
      first_name = gets.chomp.to_s
    puts "Contact's last name?"
      last_name = gets.chomp.to_s
    puts "Contact's e-mail?"
      email = gets.chomp.to_s
    puts "Any notes about contact? (y/n)"
      user_input = gets.chomp.to_s
      if user_input == "y"
        puts "Enter a note about contact"
        note = gets.chomp.to_s
      else
        note = "N/A"
      end
    contact = Contact.create(
      first_name: first_name,
      last_name: last_name,
      email: email,
      note: note
    )
  end

# This method should prompt user to enter an id for the contact to be modified. When id is entered, user is then prompted to select which attribute needs to be changed.
# ****************
  def modify_existing_contact
    puts "Enter Contact ID"
    id = gets.chomp
    contact = Contact.find_by(id: id)
# contact variable contains the contact that we want to modify
    puts "Modify Options"
    puts "[1]  First Name"
    puts "[2]  Last Name"
    puts "[3]  Email"
    puts "[4]  Note"
    puts "[5]  Exit"
    to_modify = gets.to_i
    binding.pry
    case to_modify
    when 1 then
      puts "Enter First Name"
      edit_first_name = gets.chomp
      contact.update_attribute(first_name, edit_first_name)
    when 2 then
      puts "Enter Last Name"
      edit_last_name = gets.chomp
      contact.update_attribute(last_name, edit_last_name)
    when 3 then
      puts "Enter E-mail"
      edit_email = gets.chomp
      contact.update_attribute(email: edit_email)
    when 4 then
      puts "Enter Note"
      edit_note = gets.chomp
      contact.update_attribute(note: edit_note)
    else
      exit
    end
  end


# This method should prompt user to enter the id of the contact they want to delete.
  def delete_contact
    puts "Enter Contact ID"
    search_id = gets.to_i
    contact = Contact.find(search_id)
    contact.delete
  end

#This method should show all of the contacts that exist
  def display_all_contacts
    puts Contact.all.inspect
    main_menu
  end

# This method should prompt user to select whic attribute they want to search by. When they choose, they are prompted to enter the search term. When they enter their search term, they should then be presented with the first contact who matches my search.
 # ****************
  def search_by_attribute
    puts "Search By"
    puts "[1]  First Name"
    puts "[2]  Last Name"
    puts "[3]  E-mail"
    puts "[4]  Contact ID"
    puts "[5]  Exit"
    puts "Enter a number"
    user_search_by = gets.to_i
    case user_search_by
    when 1 then
      puts "Enter First Name"
      first_name = gets.chomp
      contact = Contact.find_by(first_name: first_name)
      puts contact.inspect
    when 2 then
      puts "Enter Last Name"
      last_name = gets.chomp
      contact = Contact.find_by(last_name: last_name)
      puts contact.inspect
    when 3 then
      puts "Enter E-mail"
      email = gets.chomp
      contact = Contact.find_by(email: email)
      puts contact.inspect
    when 4 then
      puts "Enter User ID"
      id = gets.chomp
      contact = Contact.find_by(id: id)
      puts contact.inspect
    else
      exit
    end
  end

end

CRM.new

at_exit do
  ActiveRecord::Base.connection.close
end
