class Weather

  attr_reader :conditions

  def initialize
    @conditions = ["stormy", "sunny"]
  end

  def is_stormy?
    true if @conditions[rand(0..1)] == "stormy"
  end

end
