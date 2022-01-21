require 'airport'

describe Airport do
  describe '#land_plane' do

    it { is_expected.to respond_to :terminal }

    it 'recognises that a plane has landed' do
      airport = Airport.new

      expect(airport.land_plane("Boeing 747")).to eq("Boeing 747 has landed")

    end

    it 'stores the plane at the airport terminal' do

      
  
    end
  end

end
