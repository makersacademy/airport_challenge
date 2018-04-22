module Randomizer
  def self.rand_between(top, bottom)
    spread = top - bottom
    bottom + (rand * (spread + 1)).floor
  end
end
