module Weather

  def random_number 
    rand(1..3)
  end 

  def get_weather
    random_number <= 2 ? "Sunny" : "Stormy"
  end

end
