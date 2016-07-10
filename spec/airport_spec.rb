require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  describe '#land' do
    it {is_expected.to(respond_to(:land))}
  end
end
