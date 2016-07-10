require "plane"

describe Plane do
  subject(:plane) { described_class.new }

  describe '#landed?' do
    it { is_expected.to(respond_to(:landed?)) }
    it 'is not true when the plane is flying' do
      expect(subject.landed?).not_to(eq(true))
    end
    #it 'responds true when the plane has landed' do
      #expect(subject.land).not_to(be_flying)
    #end
  end

  describe '#land' do
    it { is_expected.to(respond_to(:land)) }
    it 'should changed landed? to true' do
      subject.land
      expect(subject).to(be_landed)
    end
  end

end
