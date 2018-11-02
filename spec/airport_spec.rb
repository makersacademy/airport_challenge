require 'airport.rb'

describe Airport do
  it 'checks that the airport class exists' do
    expect(Airport.new).to be_instance_of Airport
  end
  it 'will not allow plane to land if airport is full' do
    subject.plane_capacity.times { subject.plane_is_added_to_available_fleet(Plane.new) }
    expect { Plane.new.land(subject) }.to raise_error("Plane cannot land as there is no room")
  end
end
