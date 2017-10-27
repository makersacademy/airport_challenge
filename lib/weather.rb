#!/usr/bin/env ruby

class Weather
  attr_reader :storm_chance
  DEFAULT_STORM_CHANCE = 0.05

  def initialize(storm_chance = nil)
    @storm_chance = storm_chance || DEFAULT_STORM_CHANCE
  end

  def get
    if rand > @storm_chance
      :clear
    else
      :stormy
    end
  end
end
