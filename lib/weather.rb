class Weather
  attr_reader :safe

  def safe?
    rand(1..50) != 50
  end

  def initialize
    @safe = safe?
  end

end
