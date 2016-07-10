require "airport"

describe Airport do

  subject(:airport) { described_class.new }

  describe '#land' do
    it { is_expected.to(respond_to(:land)) }
    it 'can land a specified plane' do
      plane = double(:plane)
      expect(subject.land(plane)).to(eq(plane))
    end
  end

end
