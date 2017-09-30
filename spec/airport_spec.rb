require 'airport'
require 'aeroplane'
require 'weather'

describe Airport do

  let(:subject)   { Airport.new }
  let(:plane)     { Aeroplane.new }
  let(:weather)   { Weather.new }

  describe 'take_off(plane)' do
    it 'allows a plane to take off and confirms it is no longer in the airport' do
      subject.take_off(plane)
      expect(plane.landed).to be false
    end
    it 'raises a stormy weather error' do
      weather.stormy?
      expect { subject.take_off(plane) }.to raise_error 'Plane cannot take off due to storm'
    end
  end

  it 'allows a plane to land in the airport' do
    subject.land(plane)
    expect(plane.landed).to be true
  end

end
