class Airport
  attr_accessor :blocked_airport, :prevent_landing, :prevent_take_off, :name
  def initialize(name)
    @blocked_airport = false
    @prevent_landing = false
    @prevent_take_off = false
    @name = name
  end

end
