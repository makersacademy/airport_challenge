require_relative 'plane'
require_relative 'airport'

module Weather

  def self.stormy?
    [false, false, false, true].sample
  end

end

