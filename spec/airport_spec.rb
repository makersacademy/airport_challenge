require 'airport'
require 'plane'
require 'weather'

# set up full blocks to name instances of classes
# add in doubles and mocks

describe Airport do
  let(:weather_good) { double(:weather, stormy?: false) }
  let(:weather_bad) { double(:weather, stormy?: true) }

  context "Clear skies ahead" do
   subject do
     described_class.new(described_class::DEFAULT_CAPACITY, weather_good)
   end

   it 'lands planes' do
     subject {is_expected.to respond_to(:land).with(1).argument}
   end
   it 'allows planes to takeoff' do
     subject {is_expected.to respond_to(:takeoff)}
   end

   describe '#land' do
     it 'Confirms which planes are in the airport' do
       plane = Plane.new
       expect {subject.land(plane).to eq plane}
     end
     it 'Can/t land more planes than capacity' do
       Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
       expect{subject.land(Plane.new)}.to raise_error "We're full to bursting"
     end
  end

  describe '#takeoff' do
    it 'Confirms plane is no longer in the airport' do
      plane = Plane.new
      subject.land(plane)
      subject.takeoff(plane)
      expect {subject.planes.to_not include plane }
    end
    it 'Will prevent planes that aren\'t in the airport from taking off' do
      expect { subject.takeoff(Plane.new) }.to raise_error "That plane isn't in the airport"
    end
  end
end
#broken test needs to land plane while weather is good and take off while bad
    context "It was a dark stormy night" do
      subject do
        described_class.new(described_class::DEFAULT_CAPACITY, weather_bad)
      end

    it 'Will prevent planes leaving the airport in a storm' do
      plane = Plane.new
      expect{ subject.takeoff(plane) }.to raise_error "ABORT ABORT! STORMY FRONTS ARE COMING"
    end
  end
end
