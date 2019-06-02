require 'spec_helper'
require 'airport'

describe Plane do
  it 'is in air by default' do
    plane = Plane.new
    expect(plane.status_report).to eq "in air"
  end
  it 'changes status when landed' do
    plane = Plane.new
    airport = Airport.new(1)
    allow(airport).to receive(:permission_to_land_granted?) { true }
    airport.tower_permission_to_land(plane)
    expect(plane.status_report).to eq "grounded"
  end
  it 'changes assigned status' do
    plane = Plane.new(1)
    expect(plane.update).to eq "in air"
  end

end
