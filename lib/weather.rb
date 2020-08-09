class Weather
  attr_reader :weather

  def initialize
    @weather = rand(1..10)
  end

  def conditions(_number = 1)
    ["sunny"]
  end
end
