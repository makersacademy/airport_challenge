class Airport
  @@airports = []
  
  def self.list_all_airports
    @@airports
  end

  def initialize(name)
    @name = name
    @@airports << self
  end
end
