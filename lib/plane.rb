#!/usr/bin/env ruby

require_relative "airport"

class Plane
  attr_accessor :plane
  
  def ready_to_land?
    true
  end

  def flying?
    true
  end

end
