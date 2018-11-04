require 'plane'

describe Plane do

  it "makes a plane landing" do
  expect(subject).to respond_to(:land)
  end

  it "makes a plane taking off" do
  expect(subject).to respond_to(:take_off)
  end

 end


 
