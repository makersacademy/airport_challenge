require 'atc'

describe ATC do

  it 'Prevents an aircraft from landing if full' do
    test = ATC.new(0)
    expect(test.land_plane).to eq(false)
  end

  it 'Allows a plane to land' do
    test = ATC.new(10)
    expect(test.land_plane).to eq([:landed, true])
  end

  it 'Allows a plane to takeoff'do
    test = ATC.new(0)
    expect(test.takeoff).to eq([:takenoff, false])
  end

end
