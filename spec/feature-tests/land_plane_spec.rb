require 'airport'
require 'plane'

describe 'Landing a plane' do
  airport = Airport.new
  plane = Plane.new
  before do
    allow(airport.weather).to receive(:stormy?).and_return false
  end

  it 'should be able to try to land a plane' do
    expect { airport.land plane }.to_not raise_error
  end
  
  it 'should be able to try to land several planes' do
    expect { 2.times { airport.land plane } }.to_not raise_error
  end
end
