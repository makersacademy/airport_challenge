require 'airport'

describe Airport do
  describe '#land_plane' do
    it { is_expected.to respond_to :terminal }
    it 'recognises that a plane has landed' do
      airport = Airport.new
      expect(airport.land_plane("Boeing 747")).to eq("Boeing 747 has landed")
    end

    it 'stores the plane at the airport terminal' do
      airport = Airport.new
      monarch = Plane.new
      airport.land_plane(monarch)

      expect(airport.terminal).to eq([monarch])
  
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to :take_off }

    it 'checks if there is a specific plane to take off' do
      airport = Airport.new
      monarch = Plane.new
      panam = Plane.new
      airport.land_plane(monarch)
    
      expect { airport.take_off(panam) }.to raise_error ('This plane is not at the airport')
    
    end

  end

end
