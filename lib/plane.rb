class Plane   
  def land   
    @location = "airport"    
  end

  def location
    @location = "airport"
  end

  def capacity
    @capacity = 1
  end

  def no_landing
    @no_landing = "full"
  end

  def take_off
    @capacity = 0
  end

  def storm
    @information = "no_take_off"
  end 

  def stormy_weather
    @storm = "no_landing"
  end

  def fly
    @capacity = 0
  end
end


=begin
I followed the step by step user story to ensure I 
could understand what I was doing step by step. I'm not entirely 
sure if this is the best way to do this so 
please feel free to give feedback
=end