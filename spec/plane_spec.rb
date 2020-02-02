require 'plane'

describe Plane do

  it { is_expected.to respond_to(:take_off) }
  it { is_expected.to respond_to(:status).with(1).argument }
  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:stormy).with(1).argument }

  describe "#landing" do
    it "#plane can be flying or in Airport" do
      expect(subject.status("flying")).to eq ["flying"]
      expect(subject.status("Airport")).to eq ["Airport"]
    end
    
    it "#if plane tries to land but is not flying, error message returned" do
      flight = Plane.new
      weather = double(weather)
      allow(weather).to receive(:generate_weather).and_return("Not Storm")
      flight.stormy(weather)
      flight.status("Airport")
      expect { flight.land(weather) }. to raise_error('Plane already landed')
    end

    it "#if plane ties to land but it's stormy, error message returned" do
      flight = Plane.new
      weather = double("Weather.new")
      allow(weather).to receive(:generate_weather).and_return("Storm")
      flight.stormy(weather)
      expect { flight.land(weather) }. to raise_error('Plane cannot land if it is stormy')
    end
  end

  describe "#stormy" do
    it "#stormy returns a storm" do
      flight = Plane.new
      weather = double("weather")
      allow(weather).to receive(:generate_weather).and_return("Storm")
      expect(flight.stormy(weather)).to eq "Storm"
    end

    it "#stormy returns not a storm" do
      flight = Plane.new
      weather = double("weather")
      allow(weather).to receive(:generate_weather).and_return("Not Storm")
      expect(flight.stormy(weather)).to eq "Not Storm"
    end
  end

# if plane tries to land but airport is full, error message returned - in Airport

# if plane lands, change location to airport - TODO: write test for this
  describe "#takeoff" do
    it "if plane tries to take off but isn't flying" do
      flight = Plane.new
      weather = double("weather")
      allow(weather).to receive(:generate_weather).and_return("Not Storm")
      flight.status("flying")
      expect { flight.take_off(weather) }. to raise_error('Plane already flying')
    end
    it "#if plane ties to take off but it's stormy, error message returned" do
      flight = Plane.new
      weather = double("weather")
      allow(weather).to receive(:generate_weather).and_return("Storm")
      flight.stormy(weather)
      expect { flight.take_off(weather) }. to raise_error('Plane cannot take off if it is stormy')
    end
  end

# if plane takes off, change location to flying TODO - get this test to work, feature ok

=begin
it "takes off, change location to flying" do
  flight = Plane.new
  flight.take_off
  expect(@current_location). to eq("flying")
end

=end
end
