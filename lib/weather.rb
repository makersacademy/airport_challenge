# Weather objects gain a randomised @number on instantation
# #stormy is based value of @number

class Weather
  def initialize
    @number = rand(100)
  end

  def stormy
    @stormy = @number >= 90
  end
end
