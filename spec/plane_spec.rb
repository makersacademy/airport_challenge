require 'plane'

describe Plane do
  it 'responds to #report_landed' do
    expect(subject).to respond_to(:report_landed)
  end
  it 'should respond to #location' do
    expect(subject).to respond_to(:location)
  end
  it 'should report that it is landed as soon as it landed on an airport, including its ID and the ID of the airport' do
    airport = Airport.new
    plane = subject
    airport.instruct_to_land(plane)
    expect(plane.report_landed).to eq "This is plane #{plane.object_id} speaking. We report that we landed at airport #{airport.object_id}"
  end
end
