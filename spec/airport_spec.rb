require 'airport'

describe Airport do

  let(:plane) { double(:plane) }
  let(:weather) { double(:weather) }

  describe '#plane_in_hangar' do

    it 'returns false if plane is not in hangar' do
      expect(subject.plane_in_hangar?(plane)).to eq(false)
    end

    it 'returns true if plane is in hangar' do
      subject.hangar << plane
      expect(subject.plane_in_hangar?(plane)).to eq(true)
    end

  end

  describe '#hangar_full?' do

    it 'returns false if hangar is not full' do
      expect(subject.hangar_full?).to eq(false)
    end

    it 'returns true if hangar is at capacity' do
      Airport::DEFAULT_CAPACITY.times { subject.hangar << plane }
      expect(subject.hangar_full?).to eq(true)
    end

  end

  describe '#capacity' do

    it 'can set capacity of airport on creation' do
      small_airport = Airport.new(10)
      expect(small_airport.capacity).to eq(10)
    end

    it 'can set capacity of airport after creation' do
      large_airport = Airport.new
      large_airport.capacity = 30
      expect(large_airport.capacity).to eq(30)
    end

  end

end
