class Weather

  attr_reader :stormy

  def initialize
    @stormy = false
  end

  def is_stormy
    @stormy = true
  end

end
