require 'airport'

describe Airport do

  it{is_expected.to respond_to(:land).with(1).argument}

  it 'can land a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq(plane)
  end

  it 'landing a plane sets its location to current airport' do
    plane = Plane.new
    subject.land(plane)
    expect(plane.location).to eq(subject)
  end

end
