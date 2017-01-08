require 'airport'

describe Airport do

  describe "#landed?" do

    it { expect(subject).to respond_to(:landed?).with(1).argument}

    before do
      @plane = Plane.new
      @airport = subject
    end

    context "if the plane has landed" do

      it "returns true" do
        @airport::planes << @plane
        expect(@airport.landed?(@plane)).to eq true
      end
    end

    context "if the plane hasn't landed" do

      it "returns false" do
        expect(@airport.landed?(@plane)).to eq false
      end
    end
  end

  describe "#taken_off?" do

    it { expect(subject).to respond_to(:taken_off?).with(1).argument}

    before do
      @airport = subject
      @plane = Plane.new
    end

    context "if the plane hasn't taken off" do

      it "returns false" do
        @airport::planes << @plane
        expect(@airport.taken_off?(@plane)).to eq false
      end
    end

    context "if the plane has taken off" do

      it "returns true" do
        expect(@airport.taken_off?(@plane)).to eq true
      end

    end
  end

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
