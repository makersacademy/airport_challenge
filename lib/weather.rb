#!/usr/bin/env ruby

# The Weather class generates clear or stormy weather using
# a random weather generator. 
class Weather
  attr_reader :storm_chance
  DEFAULT_STORM_CHANCE = 0.05

  # Initialize with a optional or default chance of storm. The
  # chance should be expressed as a number from 0-1, representing
  # the percentage chance.
  def initialize(options = {})
    @storm_chance = options[:storm_chance] || DEFAULT_STORM_CHANCE
  end

  # Generate a random number - if above @storm_chance, then the
  # weather is clear.
  def get
    rand > @storm_chance ? :clear : :stormy
  end
end
