class Weather

  attr_reader :conditions, :random_number

  def random_weather
    @random_number = create_random_number
    if (1..10).include?(@random_number)
      @conditions = 'stormy'
    else
      @conditions = 'sunny'
    end
  end

  private

  def create_random_number
    rand(1..30)
  end
end
