require 'plane'

describe Plane do
  it 'responds to the takeoff method' do
  expect(subject).to respond_to(:takeoff)
end

  it 'responds to the land method' do
    expect(subject).to respond_to(:land)
  end

end