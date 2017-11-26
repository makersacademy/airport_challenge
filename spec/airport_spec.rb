require './lib/airport'

describe Airport do
  it 'should allow a plane to land at an airport' do
  expect{subject.to respond.to(:land).with(1).argument}
end
end
