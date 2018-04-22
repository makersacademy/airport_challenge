module Randomizer
  def self.random_range(top, bottom)
    spread = top - bottom
    bottom + (rand * (spread + 1)).floor
  end
end
