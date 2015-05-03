require 'airport'
require 'plane'

describe Airport do
  let(:plane) { Plane.new }

  context 'taking off and landing' do
    it { is_expected.to respond_to(:land).with(1).argument }
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'a plane can land' do
      subject.land(plane)
      expect(plane).to be_landed
    end

    it 'a plane can take off' do
      subject.land(plane)
      subject.take_off(plane)
      expect(plane).to be_flying
    end

    it 'a plane is no longer in the airport when it has taken off' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to be_empty
    end
  end

  context 'traffic control' do

    it 'a plane cannot land if the airport is full' do
      capacity = 10
      capacity.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error "Airport is full"
    end
  end

    it 'a plane cannot land if the weather is stormy' do
      allow(subject).to receive(:stormy?) {true}
      expect { subject.land(plane) }.to raise_error "Cannot land during storm"
    end

#     # Include a weather condition.
#     # The weather must be random and only have two states "sunny" or "stormy".
#     # Try and take off a plane, but if the weather is stormy,
#     # the plane can not take off and must remain in the airport.
#     #
#     # This will require stubbing to stop the random return of the weather.
#     # If the airport has a weather condition of stormy,
#     # the plane can not land, and must not be in the airport
  # context 'weather conditions' do
  #

#       xit 'a plane cannot land in the middle of a storm'
#     end
#   end
end