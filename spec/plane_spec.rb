require "plane"

describe Plane do
  subject(:plane) { described_class.new }

  it {is_expected.to(respond_to(:landed?))}

  describe '#landed?' do
    it 'does not return true when a plane is flying' do
      expect(subject).not_to(be(:landed))
    end
  end

end
