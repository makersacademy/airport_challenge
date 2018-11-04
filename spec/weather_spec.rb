require 'weather'
require 'plane'

describe Weather do
  it "checks for weather conditions" do
  expect(subject).to respond_to(:is_stormy?)
  end
  it "prevents landing if stormy" do
  plane1 = Plane.new
  expect { plane1.land }.to raise_error "There's a storm"
  end
  it "prevents taking off if stormy" do
  plane2 = Plane.new
  expect { plane2.take_off }.to raise_error "There's a storm"
  end
end
