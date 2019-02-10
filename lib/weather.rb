class Weather

attr_reader :weather

  def weather
    randomizer < 90 ? "sunny" : "stormy"
  end

  def randomizer
   rand(1..100)
  end


# source of code commented out below: https://github.com/ciawalsh/Airport-Challenge/blob/master/lib/weather.rb
# def weather
#   rand_num < 90 ? "Sunny" : "Stormy"
# end
#
# def rand_num
#   rand(1-100)
# end

end
