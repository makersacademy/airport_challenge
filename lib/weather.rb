require_relative 'airport'

class Weather
  attr_accessor :storm

  def initialize
    @storm = false
  end


  def stormy?
    @storm == true
  end

end
