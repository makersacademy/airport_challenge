require 'plane'

describe Plane do
  it 'responds to #report_landed' do
    expect(subject).to respond_to(:report_landed)
  end
  it 'should respond to #location' do
    expect(subject).to respond_to(:location)
  end
  it 'should be "up in the air" when initialized' do
    expect(subject.location).to eq "up in the air"
  end
  it 'should respond to #update_location_after_landing_to' do
    expect(subject).to respond_to(:update_location_after_landing_to).with(1).argument
  end
  it 'should respond to #flying?' do
    expect(subject).to respond_to(:flying?)
  end
  it 'should return true if newly instantiated and #flying is called on it' do
    expect(subject.flying?).to eq true
  end
  it 'should update location to the right airport when landed' do
    plane = subject
    airport = double(:airport)
    plane.update_location_after_landing_to(airport)
    expect(plane.location).to eq airport.object_id
  end
  it 'should report that it is landed as soon as it landed on an airport, including its ID and the ID of the airport' do
    airport = double(:airport)
    plane = subject
    plane.update_location_after_landing_to(airport)
    expect(plane.report_landed).to eq "'This is plane #{plane.object_id} speaking. We report that we landed at airport #{plane.location}'"
  end
  it 'should respond to #update_location_after_take_off_from' do
    expect(subject).to respond_to(:update_location_after_take_off_from).with(1).argument
  end
  it 'should update location to "up in the air" after take-off' do
    airport = double(:airport)
    plane = subject
    plane.update_location_after_landing_to(airport)
    plane.update_location_after_take_off_from(airport)
    expect(plane.location).to eq "up in the air"
  end
  it 'should respond to #report_take_off' do
    expect(subject).to respond_to(:report_take_off)
  end
  it 'should report that it is up in the air after take-off, including its ID' do
    airport = double(:airport)
    plane = subject
    plane.update_location_after_landing_to(airport)
    plane.update_location_after_take_off_from(airport)
    expect(plane.report_take_off).to eq "'This is plane #{plane.object_id}. We are #{plane.location}. To know us is to fly with us.'"
  end
end
