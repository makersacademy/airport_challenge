require "airport"
require "plane"

describe Plane do
  it { expect(Plane.new).to respond_to :plane_in_air }
  it { expect(Plane.new).to respond_to :plane_in_airport }
  it { expect(Plane.new).to respond_to :flying? }
  
end
