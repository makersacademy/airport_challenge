require 'air_controller'

describe AirportController do

context "set up" do
  it "new instances of planes should have some planes inside the airport" do
    expect(subject.planes).not_to eq []
  end

end

context "Confirming a plane has taken off and landed" do

  it "a plane that has taken off should return true for taken_off?" do
    allow(subject).to receive(:weather_is_bad).and_return false
    plane = double(:plane)
    allow(plane).to receive(:report_take_off)
    allow(plane).to receive(:report_landing)
    allow(plane).to receive(:taken_off?).and_return true
    subject.land_plane(plane)
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
    allow(plane).to receive(:landed?)
    expect(plane.landed?).to eq false
  end

end

context "Test for exceptions due to airport capacity" do

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

end

context "Tests for setting airport capacity" do

  it "should be able to set an airports capity" do
    new_capacity = 100
    new_airport = AirportController.new(new_capacity)
    expect(new_airport.capacity).to eq new_capacity
  end

  it "if no capacity is given, then airport capacity is equal to a DEFAULT_CAPACITY" do
    expect(subject.capacity).to eq AirportController::DEFAULT_CAPACITY
  end

end

context "Tests for exceptions due to bad weather" do

  it "landing should not be possible during bad weather" do
    allow(subject).to receive(:weather_is_bad).and_return true
    plane = double(:plane)
    expect{subject.land_plane(plane)}.to raise_error("Landing not possible - bad weather!")
  end

  it "take off should not be possible during bad weather" do
    allow(subject).to receive(:weather_is_bad).and_return true
    expect{subject.take_off_plane}.to raise_error("Take off not possible - bad weather!")
  end

end

context "Edge cases" do

  it "a plane that is already in the airport cannot be landed" do
    plane = double(:plane)
    allow(plane).to receive(:report_landing)
    subject.land_plane(plane)
    expect{subject.land_plane(plane)}.to raise_error("This plane has already landed!")
  end

  it "a plane that has taken off cannot still be in the airport it left" do
    allow(subject).to receive(:weather_is_bad).and_return false
    plane = double(:plane)
    allow(plane).to receive(:report_take_off)
    allow(plane).to receive(:report_landing)
    subject.land_plane(plane)
    take_off = subject.take_off_plane
    expect{subject.take_off_plane(take_off)}.to raise_error("This plane has already taken off!")
  end

end

end
