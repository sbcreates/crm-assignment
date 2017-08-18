require 'pry'
require_relative ('contact')

class CRM

#need to create a unique ID for each user as they're created.


#When CRM initiated, should take user to a main menu.
  def initialize
    main_menu
  end

#Want to print the main menu and tell the crm what to do depending on user selection.
  def main_menu
    print_main_menu
    user_menu_input = gets.to_i
    if user_menu_input == 1
      add_new_contact
    elsif user_menu_input == 2
      modify_existing_contact
    elsif user_menu_input == 3
      delete_contact
    elsif user_menu_input == 4
      display_all_contacts
    elsif user_menu_input == 5
      search_by_attribute
    elsif user_menu_input == 6
      "Good_bye"
    end
  end

#Print out the options for the user to choose from in main menu.
  def print_main_menu
    p "Main Menu"
    p "*-------*"
    p "1  Add New Contact"
    p "2  Modify Contact"
    p "3  Delete Contact"
    p "4  Display All Contacts"
    p "5  Search by Attribute"
    p "6  Exit"
  end

  def call_option

  end

  def add_new_contact
    p "Contact's first name?"
      first_name = gets.chomp.to_s
    p "Contact's last name?"
      last_name = gets.chomp.to_s
    p "Contact's e-mail?"
      email = gets.chomp.to_s
    p "Any notes about contact? (y/n)"
      user_input = gets.chomp.to_s
      if user_input == "y"
        p "Enter a note about contact"
        note = gets.chomp.to_s
      else
        note = "N/A"
      end
    @@contact.list << Contact.new(first_name, last_name, email, note)

  end

  def modify_existing_contact
    p "User ID?"
      contact_id = gets.chomp.to_s

  end

  def delete_contact

  end

  def display_all_contacts

  end

  def search_by_attribute

  end

  def user_id
    @user_id
  end


end

carrie = CRM.new
