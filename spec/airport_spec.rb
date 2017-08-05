require './docs/airport.rb'

describe Airport do
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it { is_expected.to respond_to(:landing).with(1).argument }
end

describe Airport do
  it "creates a plane" do
  expect {subject.create_planes}.to eq plane
  end
end
