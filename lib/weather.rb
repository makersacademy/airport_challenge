class Weather

  attr_reader :status

  def initialize
    @status
  end



  def generate_weather
    if (1..4).to_a.include?(random_number_generator) #40% chance of stormy weather
      @status = "stormy"
    else
      @status = "sunny"
    end
  end

  
  
  private
  def random_number_generator
    rand(1..10)
  end

end 