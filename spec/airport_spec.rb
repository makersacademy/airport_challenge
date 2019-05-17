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
    it 'stores the plane' do
      lsx_airport.receive(plane)
      expect(lsx_airport.planes).to include(plane)
    end
  end

end