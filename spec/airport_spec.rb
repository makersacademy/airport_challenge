require 'airport'

describe Airport do
  subject (:airport) { described_class.new }
  
  describe '#land' do
    it 'instructs planes to land at airport' do
      allow(airport).to receive(:stormy?).and_return false
      plane = Plane.new
      airport.land(plane)
      expect(plane).to eq plane
    end

    it 'planes cannot land when airport is full' do
      allow(airport).to receive(:stormy?).and_return false
      20.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error("Airport is full")
    end

    it 'prevents plane landing when weather is stormy' do
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.land(Plane.new) }.to raise_error("Plane cannot land due to stormy weather")
    end

  end

  describe '#take_off' do 
    it 'instructs planes to take off from the airport' do
      expect(airport).to respond_to :take_off
    end
  end 

end 
