require 'airport'

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
    it 'raises error if stormy during landing' do
      plane = double 'Plane.new'
      subject = Airport.new(1, true) # capacity, stormy_weather
      expect { subject.land(plane) }.to raise_error RuntimeError
    end
  end

  describe "#full?"
  it 'raises error if airport full' do
    plane = double 'Plane.new'
    subject.land(plane)
    expect { subject.land(plane) }.to raise_error RuntimeError
  end

end
