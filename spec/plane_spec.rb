require 'plane'
require 'airport'

describe Plane do
  let(:airport) { Airport.new }
  let(:plane_lands) { subject.land(airport) }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  it 'should land a plane at an airport' do
    plane_lands
    expect(airport.hangar).to eq([subject])
  end

  it 'should let a plane take off from an airport' do
    plane_lands
    subject.take_off(airport)
    expect(airport.hangar).to eq([subject] - [subject])
  end
  describe '#take_off' do
    it 'should confirm that the plane has left the airport' do
      plane_lands
      subject.take_off(airport)
      expect("#{subject} has left the #{airport}")
    end
  end
  
  describe '#land' do
    it 'raises an error when plane tries to land in a full airport' do
      airport.capacity.times { subject.land(airport) }
      expect { plane_lands }.to raise_error("Cannot land - Airport full")
    end
  end
end
