require 'spec_helper'

describe Airport do
  subject(:airport) { described_class.new }
  subject(:plane) { described_class.new }

  it 'should instruct a plane to land' do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'should confirm a plane has landed' do
    airport.land(plane)
    expect(airport.planes).to include plane
  end

  it 'should instruct a plane to take_off' do
    expect(airport).to respond_to(:take_off).with(1).argument
  end

  it 'should confirm that the plane in no longer at the Airport' do
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.planes).not_to include plane
  end
end
