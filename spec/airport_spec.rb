require 'airport'
require 'plane'
require 'weather'

describe Airport do

  describe '#take_off' do
    it 'raises error if no planes avaliable' do
      expect { subject.take_off }.to raise_error
    end

    it 'raises error if stormy weather' do
      expect { subject.take_off }.to raise_error RuntimeError
    end
  end

  describe '#land' do
    plane = Plane.new
    it 'raises error if stormy during landing' do
      subject = Airport.new(1, true) #capacity, stormy_weather
      expect { subject.land(plane) }.to raise_error RuntimeError
    end
  end

  describe "#full?"
  plane = Plane.new
  it 'raises error if airport full' do
    subject.land(plane)
    expect { subject.land(plane) }.to raise_error RuntimeError
  end

end
