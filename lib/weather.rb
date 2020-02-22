require_relative 'airport'

class Weather

  def stormy?
    rand(0..100) > 90
  end

end