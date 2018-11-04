require 'plane'

describe Plane do
  it "makes a plane landing" do
  expect(subject).to respond_to(:land)
  end
  it "prevents landing if stormy" do
  expect { subject.land }.to raise_error "There's a storm!"
  end
  it "makes a plane taking off" do
  expect(subject).to respond_to(:take_off)
  end
  it "prevents taking off if stormy" do
  expect { subject.take_off }.to raise_error "There's a storm!"
  end
 end
