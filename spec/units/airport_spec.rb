require 'airport'

describe Airport do

  before(:each) do
    @airport = Airport.new
    @plane = double('plane')
  end

  context "when initializing an airport" do

    it "is initialized with a default plane capacity" do
      expect(@airport.instance_variable_get(:@capacity)).to eq(20)
    end

    it "shouldn't be full when first created" do
      expect(@airport).not_to be_full
    end
  end

  describe '#full' do

    it { is_expected.to respond_to(:full?) }

    it "reports full if at capacity" do
      airport = Airport.new(1)
      airport.instance_variable_set(:@planes, [@plane])
      expect(airport).to be_full
    end
  end

  describe '#takeoff' do

    it "shouldn't allow unavailable planes to takeoff" do
      expect { @airport.takeoff(@plane) }.to raise_error(Airport::PLANE_UNAVAILABLE_ERROR)
    end
  end
end
