require 'airport'
require 'rspec'

describe Airport do

  context "when initializing an airport" do

    it "is initialized with a default plane capacity" do
      expect(subject.capacity).to eq(20)
    end

    it "can have its plane capacity overridden" do
      # airport = Airport.new(15)
      expect(described_class.new(15).capacity).to eq(15)
    end

    it "shouldn't be full when first created" do
      expect(subject).not_to be_full
    end
  end

  describe '#full' do

    it { is_expected.to respond_to(:full?) }

    it "reports full if at capacity" do
      airport = Airport.new(1)
      airport.instance_variable_set(:@planes, 1)
      expect(airport).to be_full
    end

  end




end
