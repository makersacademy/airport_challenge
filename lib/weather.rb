class Weather

  def condition
    weather = rand(11)
    if weather < 3
      @weather = "Stormy"
    else
      @weather = "Sunny"
    end
  end
end

# if weather <= 5? weather = "stormy ": @weather = "sunny"
