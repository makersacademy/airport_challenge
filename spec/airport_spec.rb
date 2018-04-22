require 'airport'
require 'plane'
require 'weather'

describe Airport do

  describe '#take_off' do
    it 'raises error if no planes avaliable to take_off' do
      expect { subject.take_off }.to raise_error
    end

    it 'raises error if stormy_conditions' do
      # stormy_conditions = true
      expect { subject.take_off }.to raise_error RuntimeError
    end

  end

  describe '#land' do
    plane = Plane.new
    it 'raises error if airport full' do
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error RuntimeError
    end

    it 'raise_error if stormy during landing' do
      subject = Airport.new(Weather.new.stormy_weather)
      expect { subject.land(plane) }.to raise_error RuntimeError
    end
  end

end
