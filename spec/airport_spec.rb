require 'airport_challenge.rb'

describe Airport do

  describe '#capacity' do
    it 'gives the airport capacity' do
      expect(subject.capacity).to eq Airport::AirportCapacity
    end
  end

  describe '#land' do
    it 'lands a plane with arguement' do
      is_expected.to respond_to(:plane)
    end

    it 'lands a plane' do
      subject.land
      expect(subject.land).to be_instance_of Plane
    end

    # it 'raises an error when station full' do
    #   Airport::AirportCapacity.times{ subject.land }
    #   expect{ subject.land }.to raise_error "The airport is full"
    # end
  end

  describe '#take_off' do
    it 'no plane after plane take off' do
      expect(subject.take_off).to eq 0
    end
  end

  describe '#full?' do
    it {is_expected.to respond_to(:full?)}
    it 'tells us if airport is full or not' do
      expect(subject.full?).to be(false) or be(true)
    end
  end
end
