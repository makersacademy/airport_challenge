require 'airport_challenge.rb'


describe Airport do

  describe '#capacity' do
    it 'gives the airport capacity' do
      expect(subject.capacity).to eq Airport::AirportCapacity
    end
  end

  describe '#initialize' do
    it 'variable capacity but raises error if over cap' do
      airport = Airport.new(100)
      plane = Plane.new
      100.times{ airport.land(plane) }
      expect{airport.land(plane)}.to raise_error "The airport is full."
    end
  end

  describe '#plane' do
    it 'creates a plane' do
      expect(subject.plane).to be_instance_of Plane
    end
  end

  describe '#land' do
    it 'lands a plane with arguement' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    # it 'lands a plane' do
    #   subject.land
    #   expect(subject.land).to be_instance_of Plane
    # end

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
