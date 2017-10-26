require 'plane'

describe Plane do

  describe "#can_fly" do
    it { is_expected.to respond_to(:can_fly)}

    it 'should initialize with plane able to fly' do
      expect(subject.can_fly).to be true
    end

    it "should change if plane can't fly" do
      subject.can_fly = false
      expect(subject.can_fly).to be false
    end
  end








end
