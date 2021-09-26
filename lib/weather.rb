class Weather
  attr_reader :status

  def initialize
    @status = random
  end

  def random
    if rand(10).zero?
      @status = 'stormy'
    else
      @status = 'sunny'
    end
  end

end
