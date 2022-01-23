require 'airport'

describe Airport do

  let(:plane) { double :plane }

  it { is_expected.to respond_to :capacity }

  it 'allows the system designer to change capacity' do
    airport = Airport.new
    airport.capacity = 10

    expect(airport.capacity).to eq(10)
  end

  describe '#land_plane' do

    it { is_expected.to respond_to :planes }
    it 'recognises that a plane has landed' do
      airport = Airport.new
      expect(airport.land_plane(:plane)).to eq("Successful Landing")
    end

    it 'stores the plane at the airport terminal' do
      
      aiport = Airport.new
      airport.land_plane(:plane)
      expect(airport.planes).to eq([:plane])
  
    end

    it 'will not allow a plane to land if the weather is stormy' do
      expect { subject.land_plane(:plane) }.to raise_error ('Bad Weather')
    end

  end

  describe '#take_off' do
    it { is_expected.to respond_to :take_off }

    it 'checks if there is a specific plane to take off' do
      airport = Airport.new
      panam = Plane.new
      airport.land_plane(:plane)
    
      expect { airport.take_off(panam) }.to raise_error ('This plane is not at the airport')
    
    end

    it 'will not allow a plane to take off if the weather is stormy' do
    end

  end

end
