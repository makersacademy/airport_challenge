require 'airport'

describe Plane do

  describe "#status" do
    before do
      @airport = Airport.new
      @plane = Plane.new
      allow(Weather).to receive(:stormy?) {false}
    end
    context "when plane is still flying" do
      it {expect(@plane.status).to eq("flying")}
    end
    context "when plane has landed" do
      it "status will change to landed" do
        @plane.land(@airport)
        expect(@plane.status).to eq("landed")
     end
    end
    context "when the plane has taken off" do
      it "has the status flying" do
        @plane.land(@airport)
        @plane.take_off(@airport)
        expect(@plane.status).to eq("flying")
      end
    end
  end

  describe "#land" do
    it {expect(subject).to respond_to(:land).with(1).argument}

    before do
      @airport = Airport.new
      @plane = subject
    end

    #context "if a plane lands" do
    #  it { expect{@plane.land(@airport)}.to change(@airport::planes, :count).from(0).to(1)}
    #end

  end

  describe "#take_off" do
    it {expect(subject).to respond_to(:take_off).with(1).argument}

    before do
      @airport = Airport.new
      @plane = Plane.new
      @airport::planes << @plane
    end

  end
  describe "#safe?" do

    it {expect(subject).to_not respond_to(:safe?)}

    before do
      @plane = Plane.new
      @airport = Airport.new
      allow(Weather).to receive(:stormy?) {false}
      @plane.land(@airport)
    end

    context "if the weather is safe" do
      it "will #take_off and #land" do
        allow(Weather).to receive(:stormy?).and_return( false )
        expect{@plane.take_off(@airport)}.to change{@airport.planes}
        expect{@plane.land(@airport)}.to change{@airport.planes}
      end
    end

    context "if the weather is not safe" do
      it "will not #take_off" do
        allow(Weather).to receive(:stormy?) {true}
        expect{@plane.take_off(@airport)}.to raise_error
        expect{@plane.land(@airport)}.to raise_error
      end
    end


  end

  describe "#full?" do
    before do
      @airport = Airport.new
      @plane = Plane.new
      allow(Weather).to receive(:stormy?) {false}
    end
    it { expect(@airport).to respond_to(:full?)}
    context "if the airport is full" do
      it "cannot land" do
        10.times {Plane.new.land(@airport)}
        expect{@plane.land(@airport)}.to raise_error
      end
    end
  end

  describe "#flying? and #landed?" do
    it {expect(subject).to_not respond_to(:landed?)}
    it {expect(subject).to_not respond_to(:flying?)}
    before do
      @airport = Airport.new
      @plane = subject
      allow(Weather).to receive(:stormy?) {false}
    end

    context "if the plane has #landed?" do
      it "will not #land" do
        @plane.land(@airport)
        expect{@plane.land(@airport)}.to raise_error
      end
    end
    context "if the plane is #flying?" do
      it "will not #take_off" do
        expect{@plane.take_off(@airport)}.to raise_error
      end
    end
  end

  describe "#not_in_airport?" do
    before do
      @airport = Airport.new
      @plane = subject
      allow(Weather).to receive(:stormy?) {false}
      @plane.land(@airport)
    end
    context "plane tries to #take_off from airport it is in" do
      it "takes off" do
        expect{@plane.take_off(@airport)}.to change{@airport.planes}
      end
    end
    context "plane tries to #take_off from airport it isn't in}" do
      it "raises an error" do
        expect{@plane.take_off(Airport.new)}.to raise_error
      end
    end
  end

end
