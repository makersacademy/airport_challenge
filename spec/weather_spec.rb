require 'airport'
require 'plane'
require 'weather'


RSpec.describe Weather do

  it "should report the weather when asked" do
  expect(subject).to respond_to(:report)
end

it "should set the weather to stormy" do
  expect(subject.stormy).to eq("stormy")
end

it "should set the weather to calm" do
  expect(subject.calm).to eq("calm")
end

end
