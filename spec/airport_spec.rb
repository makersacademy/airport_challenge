require 'airport'

describe Airport do

  subject (:plane) { described_class.new }

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'can confirm a plane has landed' do
      subject.land(plane)
      expect(subject.planes_in_airport).to include plane
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'can confirm plane is no longer in the airport' do
      subject.take_off(plane)
      expect(subject.planes_in_airport).not_to include plane
    end
  end


end
