require "airport"
require 'plane'

describe Airport do
  context "#land" do
    it "accepts a plane" do
      plane = Plane.new
      subject.accept(plane)
      expect(subject.contains(plane)).to eq true
    end
  end
  context "#takeoff" do
    it 'releases a plane' do
      plane = Plane.new
      subject.accept(plane)
      subject.release(plane)
      expect(subject.contains(plane)).to eq false
    end
  end

  it 'should know when reached full capacity' do
    airport = Airport.new(20)
    expect(airport.full).to eq false
    airport.capacity.times { airport.accept Plane.new }
    expect(airport.full).to eq true
  end
end
