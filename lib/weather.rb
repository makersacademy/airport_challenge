require_relative 'airport'

class Weather
  def stormy?
    @capacity.times { rand(true, false) }
  end
end
