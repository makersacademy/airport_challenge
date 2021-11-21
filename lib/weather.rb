class Weather
  attr_reader :storm

  def initialize
    @storm = rand(10)
  end

  def safe?
    @storm > 7
  end
end
