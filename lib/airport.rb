class Airport
  attr_accessor :blocked_airport, :prevent_landing
  def initialize
    @blocked_airport = false
    @prevent_landing = false
  end

end
