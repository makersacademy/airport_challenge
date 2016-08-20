require "plane"

describe Plane do

  it "confirms the landing" do
    expect(subject.landed).to eq true
  end

  it "confirms the take-off" do
    expect(subject.takeoff).to eq true
  end 

end
