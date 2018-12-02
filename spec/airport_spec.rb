require 'airport'
require 'plane'

describe Airport do 
  let(:airport) { described_class.new }    
  let(:plane) { Plane.new }

  it 'responds to #land' do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'receives a plane after landing' do
    expect(airport.land(plane)).to eql plane
  end

  it 'responds to #take_off' do
    expect(airport).to respond_to(:take_off).with(1).argument
  end

end
