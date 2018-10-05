require "./lib/airport.rb"

describe Airport do

  it "allows a plane to land" do
    expect(subject.addtraffic).to eq(true)
  end

  it "allows a plane to takeoff" do
    expect(subject.reducetraffic).to eq(true)
  end

end
