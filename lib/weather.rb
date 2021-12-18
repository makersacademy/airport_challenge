class Weather
  
  def initialize
    @weather_options = ['fine', 'stormy', 'fine', 'fine']
  end

  def stormy?
    random_number = rand(4)
    if @weather_options[random_number] == 'stormy'
      true
    else 
      false
    end
  end
end