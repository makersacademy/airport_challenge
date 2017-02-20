require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new(weather) }
  let(:plane) { Plane.new(false) }
  let(:weather) { instance_double('Weather', :stormy? => false) }

  describe "landing" do
    it "lands the plane in the airport" do
      expect(airport.land(plane)).to eq plane
    end

    it "raises an error if same plane tries to land when already landed" do
      message = "You cannot land the same plane"
      expect { 2.times { airport.land(plane) } }.to raise_error(message)
    end

    context "when there is stormy weather " do
      before do
        allow(weather).to receive(:stormy?).and_return(true)
      end

      it "prevents the plane landing in stormy weather" do
        message = "The weather is too stormy for landing"
        expect{airport.land(plane)}.to raise_error(message)
      end
    end
  end

  describe "taking off" do
    let(:plane) { Plane.new(true) }
    subject(:airport) { described_class.new(weather, [plane]) }

    it "gets the plane to take off from the airport" do
      expect(airport.take_off(plane)).not_to include(plane)
    end

    it "raises an error if there is no plane to take off" do
      message = "The plane has already taken off"
      expect { 2.times { airport.take_off(plane) } }.to raise_error(message)
    end

    context "when there is stormy weather" do
      before do
        allow(weather).to receive(:stormy?).and_return(true)
      end

      it "prevents take off in stormy weather" do
        message = "The weather is too stormy for take_off"
        expect{airport.take_off(plane)}.to raise_error(message)
      end
    end
  end

  describe "airport capacity" do
    subject(:airport) do
      described_class.new(
        weather,
        20.times.map { Plane.new(true) },
      )
    end

    context "when the airport is full" do
      it "reports that the airport is full" do
        expect(airport).to be_full
      end
    end

    context "saftey at full airport" do
      it "prevents landing when airport is full" do
        message = "Landing is not permitted as airport has reached capacity"
        expect{airport.land(plane)}.to raise_error(message)
      end
    end
  end

end
