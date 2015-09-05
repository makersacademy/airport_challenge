require 'airport'

## Note these are just some guidelines!
## Feel free to write more tests!!

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport
# and how that is implemented.
#
# If the airport is full then no planes can land

describe Airport do

  describe '#landing_plane' do
    it { is_expected.to respond_to(:landing_plane).with(1).argument }

    it 'a plane has landed at the airport' do
      plane = double :plane
      allow(subject).to receive(:weather_stormy?) {false}
      allow(plane).to receive(:landing)
      expect(subject.landing_plane(plane)).to eql(subject.planes)
    end

    context "when the airport is full" do
      it "raises an error" do
        plane = double :plane
        allow(subject).to receive(:weather_stormy?) {false}
        allow(plane).to receive(:landing)
        subject.capacity.times { subject.landing_plane(plane) }
        expect { subject.landing_plane(plane) }.to raise_error 'The Airport is full'
      end
    end

    context "when bad weather conditions" do
      it "raises an error" do
        plane = double :plane
        allow(subject).to receive(:weather_stormy?) {true}
        expect { subject.landing_plane(plane) }.to raise_error 'Bad weather conditions'
      end
    end

  end

  describe '#taking_off_plane' do
    it { is_expected.to respond_to(:taking_off_plane).with(1).argument }

    it 'a plane has left the airport' do
      plane = double :plane
      allow(subject).to receive(:weather_stormy?) {false}
      allow(plane).to receive(:landing)
      subject.landing_plane(plane)
      allow(plane).to receive(:take_off)
      subject.taking_off_plane
      expect(subject.planes).to be_empty
    end

    context "when there are no planes at the airport" do
      it 'raises an error' do
        expect { subject.taking_off_plane }.to raise_error "No planes at the airport"
      end
    end

    context 'when weather is stormy' do
      it 'raises an error' do
        plane = double :plane
        allow(subject).to receive(:weather_stormy?) {false}
        allow(plane).to receive(:landing)
        subject.landing_plane(plane)
        allow(subject).to receive(:weather_stormy?) {true}
        allow(plane).to receive(:take_off)
        expect { subject.taking_off_plane }.to raise_error 'Bad weather conditions'
      end
    end
  end

  # describe 'take off' do
  #   xit 'instructs a plane to take off'
  #
  #   xit 'releases a plane'
  # end
  #
  # describe 'landing' do
  #   xit 'instructs a plane to land'
  #
  #   xit 'receives a plane'
  # end
  #
  # describe 'traffic control' do
  #   context 'when airport is full' do
  #     xit 'does not allow a plane to land'
  #   end
end
