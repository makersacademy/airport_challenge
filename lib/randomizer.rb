module Randomizer
  def self.rand_between(lower_boundary, upper_boundary)
    lower_boundary + (rand * ((upper_boundary - lower_boundary) + 1)).floor
  end
end
