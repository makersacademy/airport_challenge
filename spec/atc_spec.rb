require 'atc'

describe ATC do

  it 'Allows user to create a aircraft name' do
    expect(subject.new_aircraft("BA-643")).to eq("BA-643")
  end

  it 'Allows a plane to land' do
    expect(subject.land_plane).to eq([:landed, true])
  end

  it 'Allows a plane to takeoff'do
    expect(subject.takeoff).to eq([:takenoff, false])
  end

end
