#!/usr/bin/env ruby

# AirportError is raised when there is a problem
# that stops aeroplanes interacting with airports.
class AirportError < RuntimeError
end

# AeroplaneError is raised when nonsensical instructions
# are issued to aeroplanes.
class AeroplaneError < RuntimeError
end
