#!/usr/bin/env ruby

require_relative "plane"

class Airport
  attr_reader :plane

  def initialize 
    @plane = plane
  end

  def land(plane)
    plane
    # if ready_to_land? == true ? true : false
  end

  def take_off 
    # fail "This plane is already in flight" unless !flying?
    # ^^ How do i access a method inside another class?
    # Look up .self again after break
    true
  end

end
