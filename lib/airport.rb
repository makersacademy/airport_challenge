#!/usr/bin/env ruby

require_relative "plane"

class Airport
  attr_reader :plane

  def initialize 
    @planes = []
  end

  def land(plane)
    @planes << plane
    # if ready_to_land? == true ? true : false
  end

  def take_off 
    "Plane has left the airport" if @planes.count.zero?
    # Do I have a test for this?

    @planes.pop if @planes.length >= 1

    # fail "This plane is already in flight" unless !flying?
    # ^^ How do i access a method inside another class?
    # Look up .self again after break
  end

end
