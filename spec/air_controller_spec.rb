require 'air_controller'

describe AirportController do

it "should respond to the method land_plane" do
  expect(subject).to respond_to (:land_plane)
end

it "should respond to the method take_off_plane" do
  expect(subject).to respond_to (:take_off_plane)
end

it "a plane that has taken off should return true for taken_off?" do
  allow(subject).to receive(:weather_is_bad).and_return false
  plane = double(:plane)
  allow(plane).to receive(:report_take_off)
  allow(plane).to receive(:taken_off?).and_return true
  subject.planes << plane
  plane = subject.take_off_plane
  expect(plane.taken_off?).to eq true
end

it "landed planes should return true for landed?" do
  plane = double(:plane)
  allow(plane).to receive(:report_landing).and_return(true)
  allow(plane).to receive(:landed?).and_return(true)
  expect(plane.landed?).to eq true
end

it "planes that have not landed should not return true for landed?" do
  allow(subject).to receive(:weather_is_bad).and_return false
  plane = double(:plane)
  allow(plane).to receive(:landed?).and_return(false)
  expect(plane.landed?).to eq false
end

it "should raise an error if you try to take_off a plane when the airport is empty" do
  allow(subject).to receive(:weather_is_bad).and_return false
  subject.take_off_plane
  expect{subject.take_off_plane}.to raise_error("There are no planes in the airport")
end


it "should raise an error if you try to land a plane when the airport is full" do
  allow(subject).to receive(:weather_is_bad).and_return false
  allow(subject).to receive(:plane_in_airport?).and_return false
  subject.take_off_plane
  capacity = AirportController::DEFAULT_CAPACITY
  plane = double(:plane)
  allow(plane).to receive(:report_landing)
  capacity.times {subject.land_plane(plane)}
  expect{subject.land_plane(plane)}.to raise_error("The airport is full!")
end

it "should be able to set an airports capity" do
  new_capacity = 100
  new_airport = AirportController.new(new_capacity)
  expect(new_airport.capacity).to eq new_capacity
end

it "if no capacity is given, then airport capacity is equal to a DEFAULT_CAPACITY" do
  expect(subject.capacity).to eq AirportController::DEFAULT_CAPACITY
end


it "new instances of planes should have some planes inside the airport" do
  expect(subject.planes).not_to eq []
end

it "landing should not be possible during bad weather" do
  allow(subject).to receive(:weather_is_bad).and_return true
  plane = double(:plane)
  expect{subject.land_plane(plane)}.to raise_error("Landing not possible - bad weather!")
end

it "take off should not be possible during bad weather" do
  allow(subject).to receive(:weather_is_bad).and_return true
  expect{subject.take_off_plane}.to raise_error("Take off not possible - bad weather!")
end

it "a plane that is already in the airport cannot be landed" do
  allow(subject).to receive(:weather_is_bad).and_return false
  plane = double(:plane)
  allow(plane).to receive(:report_landing)
  subject.land_plane(plane)
  expect{subject.land_plane(plane)}.to raise_error("This plane has already landed!")
end



end
