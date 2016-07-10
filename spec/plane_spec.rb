require 'plane'

describe Plane do
  subject(:plane) {described_class.new}
  describe '#landed?' do
    it {is_expected.to(respond_to(:landed?))}
    it 'responds true if the plane is landed' do
      expect(subject.landed?).to eq false
    end
  end
end
