require 'airport'
require 'plane'

describe Airport do
  it 'should land a plane' do
    airbus = Plane.new
    expect(subject.land(airbus)).to eq airbus
  end
  describe '#takeoff' do
    context "when not stormy" do
      it 'should remove a plane from the airport' do
        airbus = Plane.new
        expect(subject.takeoff(airbus)).to eq "#{airbus} has taken off"
      end
    end
    context "when stormy" do
      it 'should prevent take off if stormy' do
        expect(subject.takeoff(Plane.new)).to eq "it is too stormy to take off"
      end
    end
  end
end
