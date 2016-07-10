require "airport"

describe Airport do

  subject(:airport) { described_class.new }

  describe '#land' do
    it { is_expected.to(respond_to(:land)) }
    it 'can land a specified plane' do
      plane = Plane.new
      expect(subject.land(plane)).to(eq(plane.land))
    end
  end

end
