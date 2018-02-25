require 'airport'

describe Airport do

  it { is_expected.to respond_to :take_off }

  it 'checks if plane has left the airport' do
    plane = subject.take_off
    expect(plane).to be_left_airport
  end

  it { is_expected.to respond_to(:land).with(1).argument }

  describe '#take_off' do
    it 'releases a plane' do
      plane = double(:plane)
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end

    it 'raises an error when there are no planes to take off' do
      expect { subject.take_off }.to raise_error 'No planes available'
    end
  end

  describe '#land' do
    it 'docks a landing plane' do
      plane = double(:plane)
      expect(subject.land(plane)).to eq plane
    end

    it 'raises an error when airport is full' do
      subject.capacity.times { subject.land double :plane }
      expect { subject.land double(:plane) }. to raise_error 'Airport is full'
    end
  end

  describe '#initialize' do
    it 'has a variable capacity' do
      airport = Airport.new(50)
      50.times { airport.land double :plane}
      expect{ airport.land double(:plane) }.to raise_error 'Airport is full'
    end
  end

end
