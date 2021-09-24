require 'airport'

describe Airport do

  let(:plane) { Plane.new }

  describe '#initialize' do
    it "should initialize an empty array to store planes" do
      expect(subject.planes).to eq []
    end
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'should allow a plane to land' do
      expect(subject.land(plane)).to eq [plane]
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }

    it 'should allow a plane to take off' do
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end
  end
end
