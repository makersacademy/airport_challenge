require 'airport'

describe Airport do

  # All tests assume the airport is empty on set-up therefore sometimes steps
  # are required to be completed to populate an airport first

  let(:plane) { Plane.new }

  describe 'Set-up and capacity of Airport' do
    it 'Has a default capacity of 10 on set-up' do
      expect(subject.capacity).to equal 10
    end

    it 'The capacity can be changed' do
      subject.change_capacity(15)
      expect(subject.capacity).to equal 15
    end

    it 'Can have a custom capcity on set-up' do
      new_airport = Airport.new(30)
      expect(new_airport.capacity).to equal 30
    end

    it 'Has an array for planes (#landed_planes) that is empty on set-up' do
      expect(subject.landed_planes).to be_empty
    end
  end

  describe 'Can instruct a plane to land' do
    it 'Plane lands' do
      expect(subject.land_plane(plane)).to eq "#{plane} plane landed"
    end

    it 'Landed plane is now in #landed_planes' do
      subject.land_plane(plane)
      expect(subject.landed_planes).to include(plane)
    end

    it 'Throws an error if the airport is already at capacity' do
      subject.capacity.times { subject.land_plane(Plane.new) }
      expect { subject.land_plane(plane) }.to raise_error(RuntimeError, "Airport at capacity")
    end
  end

  describe 'Can instruct a plane to take off' do
    before { subject.land_plane(plane) }

    it 'Plane takes off' do
      expect(subject.plane_take_off(plane)).to eq "#{plane} plane has taken off"
    end

    it 'Throws an error if the plane was not in the airport' do
      expect { subject.plane_take_off(Plane.new) }.to raise_error(RuntimeError, "Plane not in airport")
    end

  end
end
