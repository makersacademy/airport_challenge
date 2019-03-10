require 'airport'
require 'plane'

describe Airport do
  it 'can create instances of Airport' do
    expect(Airport.new("Heathrow")).to be_a_kind_of(Airport)
  end

  describe '#log_plane' do
    it 'keeps a log of planes currently at the airport' do
      heathrow = Airport.new("Heathrow")
      plane = Plane.new
      plane.land(heathrow)
      expect(heathrow).to have_attributes(:log => [plane])
    end
  end
  describe '#planes' do
    it 'reports number of planes at the airport(singular)' do
      heathrow = Airport.new("Heathrow")
      plane = Plane.new
      plane.land(heathrow)
      expect { heathrow.planes }.to output("1 plane at the airport\n").to_stdout
    end
    it 'reports number of planes at the airport(multiple/0)' do
      heathrow = Airport.new("Heathrow")
      expect { heathrow.planes }.to output("0 planes at the airport\n").to_stdout
    end
  end

  describe '#skies_clear' do
    it 'does not authorize landing if stormy' do
      heathrow = Airport.new("Heathrow")
      expect { heathrow.skies_clear(9) }.to raise_error "Approach unsafe"
    end
  end
end
