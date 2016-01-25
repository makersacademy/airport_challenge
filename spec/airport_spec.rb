require 'airport'

describe Airport do

  it 'Holds an array of landed planes.' do
    expect(subject.instance_variable_get(:@landed_planes)).to be_a(Array)
  end

  it 'Adds the newly landed plane to the array of landed planes.' do
    plane = double(:plane)
    subject.landed_planes << plane
    expect(subject.instance_variable_get(:@landed_planes)).to include(plane)
  end

  it 'Can receive the "confirm_plane_landed" command with 1 argument.' do
    expect(subject).to respond_to(:confirm_plane_landed).with(1).argument
  end

  it 'Confirms that a newly landed plane has landed.' do
  plane = double(:plane)
  subject.landed_planes_history << plane
  subject.landed_planes << plane
  expect(subject.confirm_plane_landed(plane)).to eq(true)
  end

  it 'Can receive the "confirm_plane_taken_off" command with 1 argument.' do
    expect(subject).to respond_to(:confirm_plane_taken_off).with(1).argument
  end

  it 'Confirms that a newly taken_off plane has taken_off.' do
  plane = double(:plane)
  subject.landed_planes = []
  subject.landed_planes_history << plane
  expect(subject.confirm_plane_taken_off(plane)).to eq(true)
  end

context 'When the plane in question has never been to this airport' do
  it 'Will raise an error when attempting to confirm the plane has landed.' do
    plane = double(:plane)
    expect{subject.confirm_plane_landed(p)}.to raise_error('That plane has never been at this airport.')
  end

  it 'Will raise an error when attempting to confirm the plane has taken-off.' do
    plane = double(:plane)
    expect{subject.confirm_plane_taken_off(p)}.to raise_error('That plane has never been at this airport.')
  end
end

end
