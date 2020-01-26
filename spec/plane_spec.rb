require "plane"
require "airport"

describe Plane do 
  it "check if the plane respond to status"
  expect(subject).to respond_to :status
  end

  it "check if the plane respond to land"
  expect(subject).to respond_to :land
  end

  it "check if the plane respond to land"
  expect(subject).to respond_to :fly
  end

  it "check if the plane change to fly"
  expect(subject.fly).to respond_to "flying"
  end
end
