class Weather

  attr_reader :stormy

  stormy = true

  def initialize(stormy = false)
    @stormy = stormy
  end

  def set_stormy
   @stormy = true
  end

  



end
