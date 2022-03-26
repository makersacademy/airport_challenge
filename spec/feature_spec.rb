require 'airport'

describe Airport do
  describe 'edge cases' do
    before do
      allow(subject).to receive(:stormy?).and_return(false)
    end
    
    it 'Planes already in flight should not be able to take off' do
      double(:in_flight? => true)
      expect { subject.take_off double }.to raise_error 'Plane already in flight'
    end

    it 'Planes should only be able to take off from the airport they are in' do
      double(:in_flight? => false)
      airport1 = Airport.new
      airport2 = Airport.new
      airport1.land(double)
      expect { airport2.take_off(double) }.to raise_error 'This plane is not in this station'
    end

    it 'Planes that are landed can not land again and should be inside a airport' do
      double(:in_flight? => false)
    expect { subject.land(double) }. to raise_error 'This plane is already landed'
    end
  end
end
