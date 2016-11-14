require './lib/airport'

describe Airport do

  let(:plane) { double :plane }
  let(:plane2) { double :plane }
  let(:weather) { double :weather }

  subject(:airport_for_2) { described_class.new(2) }
  subject(:airport) { described_class.new }

  before(:each) { allow(plane).to receive(:land) }

  context 'landing a plane' do

    before(:each) { allow_any_instance_of(Weather).to receive(:stormy?).and_return false }

    it 'creating an airport should create space for planes' do
      expect(airport.planes).to eq []
    end

    it 'instructs a plane to land' do
      allow(plane).to receive(:instruct_to_land).and_return(plane)
      airport.instruct_to_land(plane)
    end

    it 'has the plane after landing' do
      airport.instruct_to_land(plane)
      expect(airport.planes).to eq [plane]
    end

    it 'does not allow a plane to land twice' do
      airport_for_2.instruct_to_land(plane)
      expect(airport_for_2.instruct_to_land(plane)).to eq "Plane has already landed"
    end
    #
    # it 'calls plane.land function' do
    #   allow(plane).to receive(:land)
    #   airport.instruct_to_land
    #   expect(plane.land).to not_eq nil
    # end

  end

  context 'confirming plane has landed' do

    before(:each) { allow_any_instance_of(Weather).to receive(:stormy?).and_return false }

    it 'should confirm plane has landed' do
      airport.instruct_to_land(plane)
      expect(airport.landed?(plane)).to eq true
    end

  end

  context 'plane taking off' do

    before(:each) { allow_any_instance_of(Weather).to receive(:stormy?).and_return false }

    it 'instructs a plane to take off' do
      allow(plane).to receive(:instruct_to_take_off)
      airport.instruct_to_take_off(plane)
    end

    it 'does not have the plane after take off' do
      airport.instruct_to_land(plane)
      airport.instruct_to_take_off(plane)
      expect(airport.planes).not_to include plane
    end

    it 'has one less plane in the airport after take off' do
      airport.instruct_to_land(plane)
      airport.instruct_to_take_off(plane)
      expect(airport.planes.length).to eq 0
    end

    it 'does not allow the same plane to take off twice' do
      airport.instruct_to_land(plane)
      airport.instruct_to_take_off(plane)
      expect(airport.instruct_to_take_off(plane)).to eq "Plane has already taken off"
    end

  end

  context 'stormy weather' do

    it 'does not allow for landing if stormy' do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return true
      expect {airport.instruct_to_land(plane)}.to raise_error
    end

    it 'allows for landing if not stormy' do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return false
      expect {airport.instruct_to_land(plane)}.not_to raise_error
    end

    it 'does not allow for take off if stormy' do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return true
      expect {airport.instruct_to_take_off(plane)}.to raise_error
    end

    it 'allows for take off if not stormy' do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return false
      expect {airport.instruct_to_take_off(plane)}.not_to raise_error
    end

  end

  context 'capacity' do

    before(:each) { allow_any_instance_of(Weather).to receive(:stormy?).and_return false }

    it 'can set a capacity for an airport' do
      expect(airport.total_capacity).not_to be_nil
    end

    it 'is created with a default capacity' do
      expect(airport.total_capacity).to eq 1
    end

    it 'can accept a required capacity' do
      airport = Airport.new(25)
      expect(airport.total_capacity).to eq 25
    end

    it 'can identify when airport is full' do
      airport.instruct_to_land(plane)
      expect(airport.full?).to eq true
    end

    it 'can identify when airport is not full' do
      expect(airport.full?).to eq false
    end

    it 'prevents landing when airport is full' do
      airport.instruct_to_land(plane)
      expect(airport.instruct_to_land(plane2)).to eq "Airport full"
    end

  end



end
