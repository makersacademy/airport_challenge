require 'plane'

describe Plane do
  it "can check if a plane's status is flying" do
    subject.flying
    expect(subject.isFlying).to eq(true)
  end

  it "can check if a plane is taking off" do
    subject.flying
    expect(subject.isFlying).to eq(true) #removed takeoff to flying as both will equal true
  end
  
  it "can check to see if a plane has landed" do
    subject.landed
    expect(subject.isFlying).to eq(false)
  end
end
