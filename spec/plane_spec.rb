require 'plane'

describe Plane do
  it 'responds to the takeoff method' do
    expect(subject).to respond_to(:takeoff)
  end

  it 'responds to the land method' do
    expect(subject).to respond_to(:land)
  end
end

describe "#takeoff" do
  it 'allows a plane to take off from the airport' do
  end

describe "#land" do
  it 'lands a plane at the airport' do
  end
end
end
