require_relative 'plane'

class Airport
  def initialize
    @my_airport = []
    @max_cap = 3
  end

  def check_ap_capacity
    @max_cap
    current_cap = @my_airport.length
    if current_cap + 1 <= @max_cap
      return true
    end
  end

  def land_plane
    # Should add plain to my_airport[]
    if check_ap_capacity == true
      if check_weather == "Sunny"
        @plane = Plane.new
        @my_airport.push(@plane)
        puts "The plane has landed" + @my_airport.to_s
        return @my_airport            
      else
        puts "The weather is STORMY!"
      end
    else
		puts "Your airport is full, wait until another plane has taken off"
    end
  end

  def search_for_plane
    # Should check if the plane is in my_airport[]
    if @my_airport.include?(@plane)
      p "This plane is in the Airport"
    else
      p "This plane has left the Airport"
    end
  end

  def take_off
    # Should remove the plane from my_airport[]
    if check_weather == "Sunny"
      @my_airport.shift
      puts "The plane has taken off and left the airport"
      puts @my_airport.to_s
      return @my_airport 
    else
      puts "The weather is STORMY!"
      puts @my_airport.to_s
    end    
  end

  def update_max_cap(num)
    @max_cap = num
  end

  def check_weather
    type = { 1 => "Sunny", 2 => "Stormy" }
    return weather = type[rand(1..2)]
  end
end
