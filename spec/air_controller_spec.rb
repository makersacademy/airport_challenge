require 'air_controller'

describe AirportController do

it "should respond to the method land_plane" do
  expect(subject).to respond_to (:land_plane)
end

it "should respond to the method take_off_plane" do
  expect(subject).to respond_to (:take_off_plane)
end

it "a plane that has taken off should return true for taken_off?" do
  subject.planes << Plane.new
  plane = subject.take_off_plane
  expect(plane.taken_off?).to eq true
end

it "landed planes should return true for landed?" do
  plane = Plane.new
  subject.land_plane(plane)
  expect(plane.landed?).to eq true
end

it "planes that have not landed should not return true for landed?" do
  plane = Plane.new
  expect(plane.landed?).to eq false
end

it "should raise an error if you try to take_off a plane when the airport is empty" do
  expect{subject.take_off_plane}.to raise_error("There are no planes in the airport")
end

it "should raise an error if you try to land a plane when the airport is full" do
  AirportController::DEFAULT_CAPACITY.times {subject.land_plane(Plane.new)}
  expect{subject.land_plane(Plane.new)}.to raise_error("The airport is full!")
end

it "should be able to set an airports capity" do
  new_capacity = 100
  new_airport = AirportController.new(new_capacity)
  expect(new_airport.capacity).to eq new_capacity
end

it "if no capacity is given, then airport capacity is equal to a DEFAULT_CAPACITY" do
  expect(subject.capacity).to eq AirportController::DEFAULT_CAPACITY
end

it "called land_plane instantiates a new weather object" do
  current_weather = subject.weather
  subject.land_plane(Plane.new)
  expect(subject.weather).not_to eq current_weather
end

it "a plane that is already in the airport cannot be landed" do
  plane = Plane.new
  subject.land_plane(plane)
  expect{subject.land_plane(plane)}.to raise_error("This plane has already landed!")
end


end
