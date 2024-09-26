require 'airport'
describe Airport do
  before(:each) do
    @airport = Airport.new
  end
  let(:plane) {double :plane}
  let(:weather) {double :weather}
  describe '#land' do
    before do
      allow(@airport.weather).to receive(:sunny?).and_return(true)
    end
    it "lands a plane" do
    expect(@airport.land(plane).length).to eq 1
    end
    it 'raises an error when full' do
      Airport::DEFAULT_CAPACITY.times do
        @airport.land(Plane.new)
      end
      expect { @airport.land(plane) }.to raise_error 'Airport full'
    end
    it "removes planes that take off" do
      @airport.land(plane)
      @airport.take_off(plane)
      expect(@airport.land(plane).length).to eq 1
    end
    it "doesn't allow planes that already landed to land" do
      @airport.land(plane)
      expect { @airport.land(plane) }.to raise_error 'Already in airport'
    end
  end
  describe '#capacity' do
    it 'has a default capacity' do
      expect(@airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end
  describe '#take_off' do
    before do
      allow(@airport.weather).to receive(:sunny?).and_return(true)
    end
    it "doesn't take off planes that aren't in the airport" do
      expect { @airport.take_off(plane) }.to raise_error 'Plane not in current airport'
    end
  end
  context "stormy weather" do
    before do
      allow(@airport.weather).to receive(:sunny?).and_return(false)
    end
    it "doesn't land if weather is stormy" do
      expect { @airport.land(plane) }.to raise_error 'Weather is too bad'
    end
    it "doesn't take off if weather is stormy" do
      expect {@airport.take_off(plane)}.to raise_error 'Plane not in current airport and weather too bad'
    end
  end
end
