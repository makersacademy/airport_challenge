require 'plane'

describe Plane do

  subject { described_class.new }

  describe "#taken_off" do
    it {is_expected.to respond_to(:taken_off)}

    it "returns plane has taken off" do
      subject.taken_off
      expect(subject).to be_working
    end
  end

  describe "#landed" do
    it {is_expected.to respond_to(:landed)}

    it "returns plane has landed" do
      subject.landed
      expect(subject).not_to be_working
    end
  end

end
