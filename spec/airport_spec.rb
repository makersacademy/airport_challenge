require 'airport'
require 'weather'

describe 'Airport' do
  let(:airport) { Airport.new }
  let(:plane) { double :plane }
  let(:weather) { Weather.new }
  
  describe '#land' do
    context "when weather is not stormy" do
      before do
        allow(airport).to receive(:stormy?).and_return(false)
      end
      it "Approves planes to land and confirms" do
        airport.land(plane)
        expect(airport.land(plane)).to eq("#{plane} has landed")
      end
      it "Confirms the plane is in the airport" do
        airport.land(plane)
        expect(airport.planes).to include(plane)
      end

      it "gives an error if the airport is full" do
        3.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error("Airport is full. Flight redirected to a different airport!")
      end
    end

    context "when weather is stormy" do 
      before do
        allow(airport).to receive(:stormy?).and_return(true)
      end
      it "raises an error" do
        expect { airport.land(plane) }.to raise_error("Plane landing is delayed due to stormy weather")
      end
    end
  end  

  describe '#take_off' do
    context 'when weather is not stormy' do
      before do 
        allow(airport).to receive(:stormy?).and_return(false)
      end
      it "approves planes to take off" do
        airport.take_off(plane)
        expect(airport.take_off(plane)).to eq("#{plane} has taken off")
      end

      it "Confirms the plane is no longer in the airport" do 
        airport.take_off(plane)
        expect(airport.planes).to_not include(plane)
      end
    end
    
    context 'when weather is stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return(true)
      end
      it 'raises an error' do
        expect { airport.take_off(plane) }.to raise_error("All planes are grounded!")
      end
    end
  end  
end
