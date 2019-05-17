require 'airport'

describe 'airport' do
  let(:lsx_airport) { Airport.new('Los Santos International','LSX') } 
  let(:dhs_airport) { Airport.new('Death Star Spaceport', 'DHS') } 
  let(:plane) { double(:plane) }

  context 'when initialising' do
    it 'cannot be initialised with less than two arguments' do
      expect { Airport.new("String 1") }.to raise_error(ArgumentError)
      expect { Airport.new }.to raise_error(ArgumentError)
      expect { Airport.new("String 1", "String 2") }.not_to raise_error
    end

    it 'stores its name' do
      expect(lsx_airport.name).to eq('Los Santos International')
      expect(dhs_airport.name).to eq('Death Star Spaceport')
    end

    it 'stores its code' do
      expect(lsx_airport.code).to eq('LSX')
      expect(dhs_airport.code).to eq('DHS')
    end

  end

  context 'when being landed at by a plane' do
    it "returns true when plane is stored" do
      expect(lsx_airport.receive(plane)).to be true
    end

    it 'stores the plane' do
      lsx_airport.receive(plane)
      expect(lsx_airport.planes).to include(plane)
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
    
  end
end