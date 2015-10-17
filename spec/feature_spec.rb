require 'airport'
require 'plane'

describe 'Airport Simulator' do

  let(:id) { "BA535" }
  let(:capacity) { 5 }
  let(:airport_name) { "LHR" }

  before(:each) do
    @plane = Plane.new id
    @airport = Airport.new(airport_name, capacity)
    allow(@airport).to receive(:weather_conditions).and_return(:sunny)
    @plane.flying = true
  end

  context 'Airport Capacity' do
    it 'Has the default capacity when no argument is given' do
      airport = Airport.new("NYC")
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'Has a different capacity when a argument is given' do
      airport = Airport.new("NYC", Airport::DEFAULT_CAPACITY+1)
      expect(airport.capacity).not_to eq Airport::DEFAULT_CAPACITY
    end
  end

  context 'The weather' do
    it 'The weather is either stormy or sunny' do
      expect(@airport.weather_conditions).to satisfy {|value| [:stormy, :sunny].include? value }
    end
  end

  context 'Landing Planes' do
    it 'lands a plane in sunny weather' do
      expect(@airport.land(@plane)).to be true
    end

    it 'A landed plane now has a location set to that airport' do
      @airport.land(@plane)
      expect(@plane.location).to eq airport_name
    end

    it 'Raises an error when trying to land a plane in stormy weather' do
      allow(@airport).to receive(:weather_conditions).and_return(:stormy)
      expect { @airport.land(@plane) }.to raise_error "Plane #{@plane.id} Cannot Land. Bad Weather!"
    end

    it 'Raises an error when trying to land a plane when airport is full' do
      @airport.capacity.times do |i|
        id = "BA50" + i.to_s
        p = Plane.new id
        p.flying = true
        @airport.land(p)
      end
      expect { @airport.land(@plane) }.to raise_error "Plane #{@plane.id} Cannot Land. Airport Full!"
    end

    it 'Raises an error when trying to land a plane that is already landed at this airport' do
      @airport.land(@plane)
      expect { @airport.land(@plane) }.to raise_error "Plane #{@plane.id} Cannot Land. Already Landed!"
    end
  end

  context 'Planes Taking Off' do

    it 'Allows a plane to take off in Sunny Weather' do
      @airport.land(@plane)
      expect(@airport.take_off(@plane)).to be true
    end

    it 'A plane that has taken off no longer has a location set to the airport it has left' do
      @airport.land(@plane)
      @airport.take_off(@plane)
      expect(@plane.location).to be nil
    end

    it 'can only take off from the airport it has landed at' do
      @airport.land(@plane)
      @plane.location = "NYC"
      expect { @airport.take_off(@plane) }.to raise_error "Plane #{@plane.id} Cannot Take Off. Wrong Airport #{@plane.location}"
    end

    it 'Raises an error when trying to instruct a plane to take off in bad weather' do
      @airport.land(@plane)
      allow(@airport).to receive(:weather_conditions).and_return(:stormy)
      expect { @airport.take_off(@plane) }.to raise_error "Plane #{@plane.id} Cannot Take Off. Bad Weather!"
    end

    it 'Raises an error when trying to instruct a non existant plane to take off' do
      @plane.flying = false
      expect { @airport.take_off(@plane) }.to raise_error "Plane #{@plane.id} Cannot Take Off. Unknown Plane!"
    end
  end
  context 'Taking off and landing ALL the things!' do
    it 'handles the taking off and landing of a maximum capacity of planes' do
      planes = []
      @airport.capacity.times do |i|
        id = "BA50" + i.to_s
        p = Plane.new id
        p.flying = true
        planes << p
      end
      planes.each {|airplane| @airport.land(airplane)}
      expect(@airport.hangar.count).to eq @airport.capacity
      planes.each {|airplane| @airport.take_off(airplane)}
      expect(@airport.hangar.count).to eq 0
    end
  end
end
