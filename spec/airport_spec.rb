require "airport.rb"
describe Airport.new(@plane, @max_capacity) do
  it { is_expected.to respond_to(:land) }
  # take plane off from an airport and confirm it is no longer there
  # take_off method. puts "plane x has taken off"
  it { is_expected.to respond_to(:take_off) }
end

describe "#land" do
  # expect land method to raise an exception if plane_at_airport == max_capacity
  it "raises an exception when airport is full" do
    if @plane == @max_capacity
      expect { Airport.new(@plane, @max_capacity).land }.to raise_error(AirportFull, "Airport at maximum capacity")
    end
  end
end

describe "#take_off" do
  it "raises an error when weather is stormy" do
    expect { Airport.new.take_off }.to raise_error(StormyWeather, "Stormy weather, can't take off")
  end
end