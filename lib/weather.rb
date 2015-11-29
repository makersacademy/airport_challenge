class Weather

  attr_reader :is_stormy
  alias_method :is_stormy?, :is_stormy


  def initialize
    @is_stormy = false
  end

  def change
    Kernel.rand(100) < 5 ? @is_stormy = true : @is_stormy = false
  end

end
