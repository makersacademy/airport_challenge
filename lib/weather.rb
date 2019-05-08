require_relative 'airport'

class Weather

  def stormy?
    return [false, false, false, true].sample
  end

end
