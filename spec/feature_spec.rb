require 'airport'

describe Airport do
  describe 'Edge cases' do
    before do
      allow(subject).to receive(:stormy?).and_return(false)
    end
    
    it 'Planes already in flight should not be able to take off' do
      expect { subject.take_off(double(:in_flight => true)) }.to raise_error 'Plane already in flight'
    end

    it 'Planes should only be able to take off from the airport they are in' do
      plane = double(:in_flight => false)
      airport1 = Airport.new
      airport2 = Airport.new
      airport1.land(plane)
      expect { airport2.take_off(plane) }.to raise_error 'This plane is not in this station'
    end

    it 'Planes that are landed can not land again and should be inside a airport' do
    expect { subject.land(double(:in_flight => false)) }. to raise_error 'This plane is already landed'
    end
  end
end
