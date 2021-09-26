require 'air_traffic_control'

describe AirTrafficControl do
  describe "#airport_capacity" do
    it 'should return the capacity of the airport' do
      control = AirTrafficControl.new(20)
      expect(control.airport_capacity).to eq 20
    end
  end

  describe "#airport_capacity" do
    it 'should return the capacity of the airport' do
      control = AirTrafficControl.new(20)
      expect(control.airport_capacity).to eq 20
    end
  end

  describe "#prevent_flights?" do
    it 'should stop flights from taking off if @weather = "stormy"' do
      weather = Weather.new
      control = AirTrafficControl.new(20)
      expect(control.prevent_flights?).to eq true if weather.weather_stormy?.eql? "stormy"
    end
  end

  describe "#prevent_flights?" do
    it 'should stop flights from taking off if @weather = "stormy"' do
      weather = Weather.new
      control = AirTrafficControl.new(20)
      expect(control.prevent_flights?).to eq false if weather.weather_stormy?.eql? "sunny"
    end
  end

  describe "#land_at_airport" do
    it 'should land at the airport if there is no storm' do
      control = AirTrafficControl.new(20)
      expect(control.land_at_airport).to eq true if control.prevent_flights?.eql? false
    end
  end

  describe "#take_off" do
    it 'should take-off if there is no storm' do
      control = AirTrafficControl.new(20)
      expect(control.take_off).to eq true if control.prevent_flights?.eql? false
    end
  end

  describe "#land_at_airport" do
    it 'should land at the airport if there is no storm' do
      control = AirTrafficControl.new(20)
      expect(control.land_at_airport).to eq "Cannot land due to storm" if control.prevent_flights?.eql? true
    end
  end

  describe "#take_off" do
    it 'should take-off if there is no storm' do
      control = AirTrafficControl.new(20)
      expect(control.take_off).to eq "Cannot take-off due to storm" if control.prevent_flights?.eql? true
    end
  end

  describe "#airport_full?" do
    it 'should return true if the airport is full' do
      control = AirTrafficControl.new(20)
      expect(control.airport_full?).to eq true if control.airport_capacity <= control.planes_amount
    end
  end

  describe "#planes_amount" do
    it 'should return the amount of planes as an integer' do
      control = AirTrafficControl.new(20)
      control.update_planes_amount(18)
      expect(control.planes_amount).to eq 18
    end
  end

  describe "#update_planes_amount" do
    it 'should take in a number as a parameter to update the amount of planes in the airport' do
      control = AirTrafficControl.new(20)
      expect(control.update_planes_amount(18)).to eq 18
    end
  end

end
