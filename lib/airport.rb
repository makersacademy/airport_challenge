class Airport


  def initialize
    rand(2)==1 ? @stormy = true : @stormy = false
    @planes = Array.new
  end

  attr_reader :planes, :stormy

end