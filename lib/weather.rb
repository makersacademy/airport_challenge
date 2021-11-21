class Weather
  attr_reader :storm

  def initialize
    @storm = rand(10)
  end
end
