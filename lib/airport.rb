class Airport

  attr_reader :stormy

  def initialize
    rand(2)==1 ? @stormy = true : @stormy = false
  end


end