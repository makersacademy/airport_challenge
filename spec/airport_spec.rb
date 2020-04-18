require 'airport'

describe Airport do
  let(:plane) { double(:plane) }
  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport

  describe '#land' do
    it 'instructs a plane to land' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'lands a plane' do
      expect(subject.land(plane)).to eq plane
    end
  end
# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport
# and confirm that it is no longer in the airport
  describe '#take_off' do
    it 'instructs a plane to take off' do
      expect(subject).to respond_to(:take_off)
    end

    it 'confirms that a plane is no longer at the airport after take_off' do
      # plane = double(:plane)

    end
  end

end
