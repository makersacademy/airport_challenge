class Plane
  attr_writer :airbourne, :in_airport, :current_airport, :flying
  attr_reader :current_airport, :flying

  def initialize
    @flying = true
    @in_airport = false
    @current_airport = ""
  end

  def flying?
    return @flying
  end

end
