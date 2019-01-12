require 'airport'
require 'plane'
require 'rspec'

describe Airport do

  context "when initializing an airport" do

    it "is initialized with a default plane capacity" do
      expect(subject.instance_variable_get(:@capacity)).to eq(20)
    end

    it "shouldn't be full when first created" do
      expect(subject).not_to be_full
    end
  end

  describe '#full' do

    it { is_expected.to respond_to(:full?) }

    it "reports full if at capacity" do
      airport = Airport.new(1)
      airport.instance_variable_set(:@planes, [Plane.new])
      expect(airport).to be_full
    end
  end

  describe '#stormy?' do
    it 'should report true when weather is stormy' do

    end

  end
end
