def initialize
   @airport = []   # airport array created to track number of planes on the ground
end

def menu      # providing the user with a series of options
  puts "Select an option:"
  puts "1. Arrive"
  puts "2. Depart"
  puts "3. Change airport size"
  option = gets.chomp 
  if option == "1"
    add_plane
    elsif option == "2"
      take_off
      elsif option == "3"
        airport_size
      
  else
  end
end

def add_plane #adds plane to airport
  puts "Is there a plane inbound? (type 'yes' or 'no')"
  input = gets.chomp
  while input == "yes"
    puts "Enter the flight number"
    planenumber = gets.chomp
    puts "*WARNING*"
    puts "You must check weather before giving confirmation to land!"
    puts "Press 'w' to check for weather"
    weather_check_option = gets.chomp
      if weather_check_option == "w"
         weather_status = rand(1..3)
         puts "Conditions:"
         puts "1 = Dry"
         puts "2 = Rainy"
         puts "3 = STORMY"
         puts "The conditions for this plane are: #{weather_status}"
      else puts "You cannot continue without checking the weather!"
      
      end
    if weather_status != 3
      @airport << planenumber
    else puts "***WARNING IT IS TOO DANGEROUS FOR THIS PLANE TO LAND***"
    end
      puts "Is there another plane inbound?"
      input = gets.chomp
      if input != "yes"
        puts "Here are the flight numbers landing: "
        puts @airport
        puts "Press 'm' to go back to the menu"
        menureturn = gets.chomp
        if menureturn == "m"
          menu
        end
        break
      end
  end
end

def take_off
  puts "Is a plane ready take off?"
  input = gets.chomp
  while input == "yes"
    puts"Enter plane number"
    planenumber = gets.chomp
    puts "*WARNING*"
    puts "You must check weather before giving confirmation to depart!"
    puts "Press 'w' to check for weather"
    weather_check_option = gets.chomp
      if weather_check_option == "w"
         weather_status = rand(1..3)
         puts "Conditions:"
         puts "1 = Dry"
         puts "2 = Rainy"
         puts "3 = STORMY"
         puts "The conditions for this plane are: #{weather_status}"
      else puts "You cannot continue without checking the weather!"
      end
      if weather_status != 3
        @airport.delete(planenumber)
      else puts "***WARNING IT IS TOO DANGEROUS FOR THIS PLANE TO TAKE OFF***"
      end
      puts "Is there another plane departing?"
      input = gets.chomp
      if input != "yes"
        puts "Here are the flight numbers remaining on the ground : "
        puts @airport
        puts "Press 'm' to go back to the menu"
        menureturn = gets.chomp
        if menureturn == "m"
          menu
        end
        break
      end
  end
end
    

def airport_size
  current_size = 5 
  @size = current_size
  
  puts "Enter a new airfield capacity or press 'm' to return to the menu"
  puts "Current max capacity: #{@size} aircraft"
  input = gets.chomp
  if input == "m"
    menu
  else new_size = input.to_i
    @size = 0
    @size += new_size
    puts "The new capacity is #{@size} aircraft!"
  end
end
    
    
    
    
    
    



initialize

menu


