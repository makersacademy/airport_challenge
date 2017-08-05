require './lib/airport.rb'

describe Airport do
  it "land a plane" do
    expect(subject.land(:plane)).to eq subject.instance_variable_get(:@planes)
  end
  it "plane takes off" do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq subject.instance_variable_get(:@planes.empty?)
  end
  it "plane takes off and no more planes left" do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq subject.send(:empty? == true)
  end
  it "plane is no longer in the airport" do
    expect { subject.take_off(:plane) }.to raise_error('No planes present')
  end
end
