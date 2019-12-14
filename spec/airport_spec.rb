require 'airport'

describe Airport do

  let(:plane) {double('plane')}

  describe '#initialization' do
    it {expect(subject).to be_an_instance_of Airport}
  end

  describe '#land' do
    it 'allows a plane to land in the dock' do
      subject.land(plane)
      expect(subject.landing_area).to include plane
    end
  end

end