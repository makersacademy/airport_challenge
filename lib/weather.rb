require_relative 'plane'
require_relative 'airport'

module Weather

  def self.stormy?
    [true, true, true, false].sample
  end

end

