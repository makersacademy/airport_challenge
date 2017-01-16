require 'airport'

describe Airport do

  describe "#capacity" do

    before do
      @airport = Airport.new
      @plane = Plane.new
      allow(Weather).to receive(:stormy?) {false}
      @plane.land(@airport)
    end

    it { expect(subject).to respond_to(:capacity)}

    it "tells us the capacity" do
      p "Here",  @airport.capacity
      expect(@airport.capacity).to eq(10)
    end
  end

  describe "DEFAULT_CAPACTY" do
    it { expect(Airport::DEFAULT_CAPACITY).to eq 10}
  end

  describe "set #capacity" do
    airport = Airport.new(30)
    it {expect(airport.capacity).to eq(30)}
  end


end
