def initialize
   @airport = []  # airport array created to track number of planes on the ground
end

def menu      # providing the user with a series of options
  puts "Select an option:"
  puts "1. Arrive"
  puts "2. Depart"
  puts "3. Change airfield capacity"
  puts "--------------"
  option = gets.chomp # user menu selection 
  puts "--------------"
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
  puts "Is there a plane inbound? (type 'yes' or 'no')" # checks whether a plane is inbound
  puts "--------------"
  input = gets.chomp
  puts "--------------"
  while input == "yes"
    total_aircraft_grounded = @airport.length # returns number of aircraft on the ground
    puts "Total aircraft grounded: #{total_aircraft_grounded}"
    puts "--------------"
    if total_aircraft_grounded == @size # checks if airfield has reached full capacity
        puts "*WARNING*"
        puts "--------------"
        puts "There are #{total_aircraft_grounded} aircraft grounded. The maximum is #{@size}" # returns current number of aircraft
        puts "--------------"
        puts "Aircraft must depart before any more arrive!" # Warns no more aircraft can arrive
        puts "--------------"
        take_off
    end
    puts "Enter the flight number" # another flight number landing
    planenumber = gets.chomp
    puts "--------------"
    puts "*WARNING*"
    puts "--------------"
    puts "You must check weather before giving confirmation to land!"
    puts "--------------"
    puts "Press 'w' to check for weather" # receives confirmation to check weather
    puts "--------------"
    weather_check_option = gets.chomp
      if weather_check_option == "w"
        puts "--------------"
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
    else puts "***WARNING IT IS TOO DANGEROUS FOR THIS PLANE TO LAND***" # weather is too dangerous to land
    end
    puts "--------------"
      puts "Is there another plane inbound?" # checks for more planes inbound
      puts "--------------"
      input = gets.chomp
      puts "--------------"
      if input != "yes"
        puts "Here are the flight numbers landing: " # returnsairfield capacitants
        puts @airport
        puts "--------------"
        puts "Press 'm' to go back to the menu" # return to menu option
        menureturn = gets.chomp
        puts "--------------"
        if menureturn == "m"
          menu
        end
       
        break
        
      end
  end
end

def take_off # aircraft departure method
  puts "Is a plane ready take off? (type 'yes' or 'no')"
  puts "--------------"
  input = gets.chomp
  puts "--------------"
  while input == "yes"
    total_aircraft_grounded = @airport.length # returns current number of aircraft on the ground
    puts "Total aircraft grounded: #{total_aircraft_grounded}"
    puts "--------------"
    puts"Enter plane number" # takes flight number for departing aircraft
    puts "--------------"
    planenumber = gets.chomp
    puts "--------------"
    puts "*WARNING*"
    puts "--------------"
    puts "You must check weather before giving confirmation to depart!" # asks to check weather
    puts "--------------"
    puts "Press 'w' to check for weather" 
    puts "--------------"
    weather_check_option = gets.chomp
      if weather_check_option == "w" 
        puts "--------------"
         weather_status = rand(1..3) # random number to simulate weather
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
      puts "--------------"
      puts "Is there another plane departing?"
      puts "--------------"
      input = gets.chomp
      puts "--------------"
      if input != "yes"
        puts "--------------"
        puts "Here are the flight numbers remaining on the ground : "
        puts @airport
        puts "--------------"
        puts "Press 'm' to go back to the menu"
        puts "--------------"
        menureturn = gets.chomp
        puts "--------------"
        if menureturn == "m"
          menu
        end
        break
      end
  end
end
    

def airport_size  # change capacity of airfield to use on different airports
  current_size = 5 # default settings
  @size = current_size
  
  puts "Enter a new airfield capacity or press 'm' to return to the menu" # option to return to menu
  puts "Current max capacity: #{@size} aircraft"
  input = gets.chomp
  if input == "m"
    menu
  else new_size = input.to_i
    @size = 0 # resets the capactiy to zero
    @size += new_size      # sets new capacity
    puts "The new capacity is #{@size} aircraft!"
    puts "Type 'm' to return to the menu"
    input = gets.chomp 
    if input == "m"
      menu
    else puts "Your update has been saved. Enter 'm'"
    end
  end
end
    

initialize

menu


