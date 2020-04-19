require 'airport'

RSpec.describe Airport do
  subject(:airport) { described_class.new(20)}
  let(:plane) { double :plane, land: nil, take_off: nil }
 
  describe '#land' do
    context 'when not stormy' do 
      it 'instructs plane to land' do
        expect(subject).to respond_to(:land).with(1).argument
      end
    end
    context 'when full' do 
      it 'raises an error' do
        allow(subject).to receive(:stormy?).and_return false
        20.times { subject.land plane }
        expect { subject.land plane }.to raise_error 'Cannot land plane: Airport is at capacity'
      end
    end
    context 'when stormy' do 
      it 'raises error' do 
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.land(plane)}.to raise_error "Cannot land plane: Weather is stormy"
      end
    end
  end

  describe '#take_off' do 
    context 'when not stormy' do 
      before do 
        allow(subject).to receive(:stormy?).and_return false
      end
      it 'instructs plane to take off' do
        airport.land(plane)
        expect(plane).to receive(:take_off)
        airport.take_off(plane)
      end 
      it 'returns the plane that took off' do 
        subject.land(plane)
        expect(subject.take_off(plane)).to eq plane
      end
      it 'raises an error if plane is not at this airpoirt' do 
        other_airport = described_class.new
        allow(other_airport).to receive(:stormy?).and_return false
        other_airport.land(plane)
        expect { subject.take_off(plane) }.to raise_error 'Cannot take off plane: plane not at airport'
      end
    end

    context 'when stormy' do
      it 'raise error' do 
        allow(subject).to receive(:stormy?).and_return true
        expect { subject.take_off(plane)}.to raise_error "Cannot take off plane: Weather is stormy"
      end
    end  
  end
  
  describe "#capacity" do   
    it 'has a default of 20' do
      airport = Airport.new 
      allow(airport).to receive(:stormy?).and_return false
      20.times do 
        the_plane = Plane.new
        airport.land(the_plane)
      end
        expect { airport.land(plane) }.to raise_error 'Cannot land plane: Airport is at capacity'
      end
    it "allows you to change capacity" do
      airport = Airport.new(10)
      allow(airport).to receive(:stormy?).and_return false
      10.times do 
        the_plane = Plane.new
        airport.land(the_plane)
      end
      expect { airport.land(plane) }.to raise_error 'Cannot land plane: Airport is at capacity'
    end
  end

end

