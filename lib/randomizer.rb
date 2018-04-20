module Randomizer
  def self.rand_between(lower_boundary, upper_boundary)
    spread = upper_boundary - lower_boundary
    lower_boundary + (rand * (spread + 1)).floor
  end
end
