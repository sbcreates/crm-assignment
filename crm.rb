require 'pry'
require_relative('contact.rb')

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
    p "Main Menu"
    p "*-------*"
    p "[1]  Add New Contact"
    p "[2]  Modify Contact"
    p "[3]  Delete Contact"
    p "[4]  Display All Contacts"
    p "[5]  Search by Attribute"
    p "[6]  Exit"
    p "Enter a number"
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
    Contact.create(first_name, last_name, email, note)
    p Contact.all
  end

# This method should prompt user to enter an id for the contact to be modified. When id is entered, user is then prompted to select which attribute needs to be changed.
  def modify_existing_contact
    user = {}
    puts "User ID?"
    search_id = gets.to_i
    Contact.all.each do |person|
      if person.contact_id == search_id
        user = person
      end
    end
    puts user
    user.update
  end


# This method should prompt user to enter the id of the contact they want to delete.
  def delete_contact

  end

#This method should show all of the contacts that exist
  def display_all_contacts
    Contact.all
  end

# This method should prompt user to select whic attribute they want to search by. When they choose, they are prompted to enter the search term. When they enter their search term, they should then be presented with the first contact who matches my search.
  def search_by_attribute

  end

end

CRM.new
p Contact.all
p Contact.inspect
Contact.create("A", "B", "C", "N/A")
Contact.create("B", "C", "D", "N/A")
Contact.create("C", "D", "E", "N/A")
