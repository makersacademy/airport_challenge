require "./lib/Plane.rb"

describe Plane do

  it "plane should be flying" do
    plane = Plane.new
    plane.flying
   expect(subject.flying).to eq false
  end

  it "plane can not land if already landed" do
    airport = Airport.new
    allow(airport).to receive(:stormy?).and_return false
    allow(subject).to receive(:landed).and_return true
    expect { airport.land(subject) }.to raise_error "Can not land, plane has already landed!"
    end

  it "plane can land and then take off" do
    airport = Airport.new
    allow(airport).to receive(:stormy?).and_return false
    allow(subject).to receive(:landed).and_return false
    expect(airport.land(subject))
    expect(airport.take_off(subject))
  end
end
