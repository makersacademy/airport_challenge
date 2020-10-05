require "air_traffic_controller"

describe AirTrafficController do
  describe '#instruct_to_land' do
    it "instructs planes that they can land" do
      atc = AirTrafficController.new
      expect(atc.instruct_to_land).to eq("a plane can land at the airport")
    end
  end

  describe '#instruct_to_take_off' do
    it "instructs a plane that they can take off" do
      atc = AirTrafficController.new
      expect(atc.instruct_to_take_off).to eq("a plane can take off from the airport, and it is confirmed that it is no longer in the airport")
    end
  end

  describe '#prevent_plane_landing_airport_is_full' do
    it "prevents a plane from landing as the airport is full" do
      atc = AirTrafficController.new
      expect(atc.prevent_plane_landing_airport_is_full).to eq("a plane cannot land at the airport as the airport is full")
    end
  end

  describe '#random_weather' do
    it "returns a 1 if weather is sunny and a 2 if weather is stormy" do
      atc = AirTrafficController.new
      allow(atc). to receive(:rand).and_return(2)
      expect(atc.random_weather).to eq(2)
    end
  end

  describe '#prevent_takeoff_due_to_weather' do
    it "prevents a plane from taking off due to bad weather" do
      atc = AirTrafficController.new
      expect(atc.prevent_takeoff_due_to_weather).to eq("a plane cannot take off from the airport due to bad weather")
    end
  end

  describe '#prevent_landing_due_to_weather' do
    it "prevents a plane from landing due to bad weather" do
      atc = AirTrafficController.new
      expect(atc.prevent_landing_due_to_weather).to eq("a plane cannot land at the airport due to bad weather")
    end
  end

  describe '#plane_status' do
    it "confirms if the plane is in the air" do
      atc = AirTrafficController.new
      expect(atc.plane_status).to eq(true)
    end
  end
end
