#!/usr/bin/env ruby

class Aeroplane
  attr_reader :airport

  def initialize(airport = nil)
    @airport = airport
  end

  def flying?
    !@airport
  end

  def is_flying_check
    raise AeroplaneError, "is already flying" if flying?
  end

  def is_grounded_check
    raise AeroplaneError, "already landed" if !flying?
  end
end
