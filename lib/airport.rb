class Airport
  attr_reader :identifier, :capacity

  def initialize(identifier = :default_identifier, capacity = 50)
    @identifier = identifier
    @capacity = capacity
  end

end
