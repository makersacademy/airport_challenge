def initialize
  @airport = []   # max size of 25 planes has been set
end

def menu
  puts "Select an option:"
  puts "1. Arrive"
  puts "2. Depart"
  option = gets.chomp 
  if option == "1"
    add_plane
    elsif option == "2"
      take_off
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
      break
    end
  end
end





initialize

menu


