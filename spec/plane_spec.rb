require "plane"

describe Plane do 
  it "check if the plane respond to status"
  expect(subject).to respond_to :initialize
  end

  it "check if the plane respond to land" do
  expect(subject).to respond_to :land
  end

  it "check if the plane respond to land" do
  expect(subject).to respond_to :fly
  end

  it "check if the plane change to fly" do
  expect(subject.fly).to respond_to "flying"
  end

