require 'airport'

describe 'airport' do
  let(:lsx_airport) { Airport.new(good_weather, 'Los Santos International','LSX') } 
  let(:dhs_airport) { Airport.new(good_weather, 'Death Star Spaceport', 'DHS') } 
  let(:lsx_airport_stormy) { Airport.new(stormy_weather, 'Death Star Spaceport', 'DHS') } 
  let(:dhs_airport_stormy) { Airport.new(stormy_weather, 'Death Star Spaceport', 'DHS') } 
  let(:tiny_airport) { Airport.new(good_weather, "Tiny airport", 'TNY', 1)  }
  let(:plane) { double(:plane) }
  let(:second_plane) { double(:plane) }
  let(:good_weather) { double(:weather, :stormy? => false) }
  let(:stormy_weather) { double(:weather, :stormy? => true) }
  let(:capacity_error_message) { Airport::CAPACITY_ERROR_MESSAGE }

  context 'when initialising' do
    it 'cannot be initialised with less than three arguments' do
      expect { Airport.new("String 1") }.to raise_error(ArgumentError)
      expect { Airport.new }.to raise_error(ArgumentError)
      expect { Airport.new("String 1", "String 2") }.to raise_error(ArgumentError)
      expect { Airport.new(good_weather, "String 1", "String 2") }.not_to raise_error
      expect { Airport.new(good_weather, "Tiny airport", 'TNY', 1) }.not_to raise_error
    end

    it 'stores its name' do
      expect(lsx_airport.name).to eq('Los Santos International')
      expect(dhs_airport.name).to eq('Death Star Spaceport')
    end

    it 'stores its code' do
      expect(lsx_airport.code).to eq('LSX')
      expect(dhs_airport.code).to eq('DHS')
    end

    it 'stores its capacity' do
      expect(tiny_airport.capacity).to be 1
    end

    it 'has a default capacity of 5' do
      expect(lsx_airport.capacity).to be 5
    end
  end

  context 'when being landed at by a plane' do

    it 'clears for landing when weather is fine' do
      expect(lsx_airport.cleared_for_landing?(plane)).to eq(true)
    end

    it "returns true when plane is stored" do
      expect(lsx_airport.receive(plane)).to be true
    end

    it 'stores the plane' do
      lsx_airport.receive(plane)
      expect(lsx_airport.planes).to include(plane)
    end

    it 'does not clear landing if the weather is stormy' do
      expect(lsx_airport_stormy.cleared_for_landing?(plane)).to eq(:weather)
    end

    it 'does not clear landing if the airport is full' do
      tiny_airport.receive(plane)
      expect(tiny_airport.cleared_for_landing?(second_plane)).to eq(:capacity)
    end

    it 'raises an error if forced to receive planes where the airport is full' do
      tiny_airport.receive(plane)
      expect { tiny_airport.receive(second_plane) }.to raise_error(RuntimeError, capacity_error_message)
    end
  end

  context 'when asked if it contains a plane' do
    it 'returns true if it contains the plane' do
      lsx_airport.receive(plane)
      expect(lsx_airport.contains?(plane)).to be true
    end

    it 'returns false if it does not contain the plane' do
      expect(lsx_airport.contains?(plane)).to be false
    end
  end

  context 'when being taken off from by a plane' do
    it "returns true when plane is released" do
      lsx_airport.receive(plane)
      expect(lsx_airport.release(plane)).to be true
    end

    it 'no longer contains the plane after takeoff' do
      lsx_airport.receive(plane)
      lsx_airport.release(plane)
      expect(lsx_airport.planes).not_to include(plane)
    end
    
    it 'does not allow takeoff if weather is stormy' do
      lsx_airport_stormy.receive(plane)
      expect(lsx_airport_stormy.cleared_for_takeoff?(plane)).to eq(:weather)
    end

    it 'clears plane for takeoff if weather is OK and plane is present' do
      lsx_airport.receive(plane)
      expect(lsx_airport.cleared_for_takeoff?(plane)).to be true
    end
  end
end