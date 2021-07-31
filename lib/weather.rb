class Weather
attr_reader :safe

  def safe?
    rand(1..50) == 50 ? false : true
  end

  def initialize
    @safe = safe?
  end

end