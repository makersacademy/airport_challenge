require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  it { is_expected.to respond_to(:status) }

  describe "request a plane to land" do
    it { is_expected.to respond_to(:land) }

    it 'returns true, if plane is requested to land' do
      plane.land
      expect(subject.status).to eq true
    end
  end

  describe "requests a plane to take_off" do
    it { is_expected.to respond_to(:take_off) }

    it "returns false, if plane is requested to take_off" do
      plane.take_off
      expect(subject.status).to eq false
    end
  end
end
