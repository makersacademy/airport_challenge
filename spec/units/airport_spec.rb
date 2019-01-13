require 'airport'

describe Airport do

  before(:each) do
    @airport = Airport.new
    @plane = double('plane')
  end

  context "when initializing an airport" do

    it "is initialized with a default plane capacity" do
      expect(@airport.instance_variable_get(:@capacity)).to eq(Airport::DEFAULT_CAPACITY)
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

    it 'should instruct planes to takeoff' do
      allow(@airport).to receive(:weather_safe?).and_return(true)
      allow(@plane).to receive(:land)
      @airport.land(@plane)

      expect(@plane).to receive(:takeoff)
      @airport.takeoff(@plane)
    end

  end

  describe '#land' do

    it 'should instruct planes to land' do
      allow(@airport).to receive(:weather_safe?).and_return(true)
      expect(@plane).to receive(:land)
      @airport.land(@plane)
    end
  end
end
