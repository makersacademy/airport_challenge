class Plane

  attr_reader :current_airport

  def initialize
    @current_airport = nil
  end

  def flying?
    @current_airport == nil
  end

end
