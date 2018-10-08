#As an air traffic controller 
#So I can get passengers to a destination 
#I want to instruct a plane to land at an airport



#As an air traffic controller 
#To ensure safety 
#I want to prevent landing when the airport is full 



class Airport
  

  
  def initialize
     @airport = Array.new(25)   # max size of 25 planes has been set       
     
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
      puts "There are #{@airport_length} planes here" #number of planes on the ground
      
      @airport << planenumber
      puts "Is there another plane inbound?"
      input = gets.chomp
    if input != "yes"
      puts "Here are the flight numbers inbound: "
      puts @airport
      break
    end
    end
  end
   
#As an air traffic controller 
#So I can get passengers on the way to their destination 
#I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
 
#As an air traffic controller 
#To ensure safety 
#I want to prevent takeoff when weather is stormy 

def take_off_weather
  puts "Enter the flight number"
      planenumber = gets.chomp
      @airport.delete(planenumber)
      puts "Is there another plane ready for take off?"
      input = gets.chomp
    if input != "yes"
      puts "Here are the flight numbers which remain at the airport: "
      puts @airport
    end
end

 def take_off
   puts "Is a plane ready take off?"
       input = gets.chomp
 while input == "yes"
    puts "Is the weather stormy? (type 'yes' or 'no')"
    input2 = gets.chomp
    if input2 != "yes"
    take_off_weather
  else 
    puts "The weather is not suitable for take off" 
    if input != yes
      puts "Here are the flight numbers remaining at the airport: "
      puts @airport
    end
 break
   
    end
 end
 end
 
#As an air traffic controller 
#To ensure safety 
#I want to prevent landing when weather is stormy 

def landing_weather
  puts "Enter the flight number"
      planenumber = gets.chomp
      @airport << planenumber
      puts "Is there another plane inbound for landing?"
      input = gets.chomp
    if input != "yes"
      puts "Here are the flight numbers remaining at the airport: "
      puts @airport
    end
end

 def landing
   puts "Is a plane ready to land?"
       input = gets.chomp
 while input == "yes"
    puts "Is the weather stormy? (type 'yes' or 'no')"
    input2 = gets.chomp
    if input2 != "yes"
    landing_weather
    puts "Is another plane ready to land?"
    input = gets.chomp
    if input != "yes"
      break
    end
  else 
    puts "The weather is not suitable for landing"
    
   
    end
 end
 end




end



