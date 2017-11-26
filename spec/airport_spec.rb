require './lib/airport'

describe Airport do
  it 'should allow a plane to land at an airport' do
  expect{subject.to respond.to(:land).with(1).argument}
  end

  it 'should allow a plane to take-off' do
    expect{subject.to respond.to(:take_off).with(1).argument}
  end

  it 'should see how many planes are in the airport' do
    expect{subject(:landed_planes).to eq []}
  end


end
