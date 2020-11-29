require 'airport'
require 'plane'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  it 'removes plane from airport after take off' do
    plane = Plane.new
    subject.land(plane)
    subject.land(Plane.new)
    subject.take_off(plane)
    expect(subject.planes).not_to include(plane)
  end

  it 'returns a message to say plane has taken-off' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off(plane)).to include "#{plane} has taken off"
  end

  it { is_expected.to respond_to(:planes) }

  it 'allows planes to land' do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
  end

  it 'adds landed plane to planes array' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes).to include(plane)
  end

  it 'has default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe '#land' do
    it 'raises an error when the airport is full' do
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error 'Airport full'
    end
  end

  describe 'initialization' do
    it 'has a variable capacity' do
      airport = Airport.new(10)
      10.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error 'Airport full'
    end
  end

  # describe '#take_off' do
  #   it 'raises an error when there is no plane to take off' do
  #     expect { subject.take_off }.to raise_error 'No planes available'
  #   end
  # end
end
