require 'airport'

describe Airport do
  it "test if method initialize exists" do
  expect(subject).to respond_to :initialize
  end
end

describe Airport do
  it "test if method land exists" do
  expect(subject).to respond_to :land
  end
end

describe Airport do
  it "test if method takeoff exists" do
  expect(subject).to respond_to :takeoff
  end
end

describe Weather do
  it "test if method initialize exists" do
  expect(subject).to respond_to :initialize
  end
end

describe Weather do
  it "test if method stormy exists" do
  expect(subject).to respond_to :stormy
  end
end

describe Plane do

end
