# require 'spec_helper'
require "plane"


 describe Plane do
   it "#land at the airport" do
    plane = Plane.new
    airport = Airport.new
    expect { airport.land(plane) }.not_to raise_error('this airport is full')   
    end
 end
