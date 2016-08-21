require_relative 'airport'

class Weather

  def self.stormy?
    rand(1..10) > 8
  end

end
