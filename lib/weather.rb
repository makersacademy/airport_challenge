class Weather

 attr_accessor :stormy

  def initialize
    @stormy = stormy?
  end

  def stormy?
    conditions = rand(5)
    conditions == 1 ? true : false
  end
end
