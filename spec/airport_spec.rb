require "Airport"

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }

  describe '#land' do
    it "allows plane to land (add to array)" do
      expect(subject.land(:plane)).to include :plane
    end
  end

  describe '#take_off' do
    it "allows plane to take off(remove from array)" do
      subject.land(:plane)
      subject.take_off(:plane)
      expect(subject.planes.include?(:plane)).to eq false
    end

    it "confirms take off" do
      subject.land(:plane)
      expect(subject.take_off(:plane)).to eq("We have take off")
    end
  end

end
