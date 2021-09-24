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

  # describe "#initialize" do
  #   it 'should set up the airport object with an instance variable with weather random_weathers return' do
  #     expect(subject).to eq "stormy" or "sunny"
  #   end
  # end

end
