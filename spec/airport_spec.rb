require 'airport'

plane = Plane.new

describe Airport do
  it {is_expected.to respond_to :takeoff_plane }

  it 'allows a plane to take off' do
    plane = subject.takeoff_plane
    #expect(plane).to be_good_weather?
    #expect(subject.good_weather?).to eq plane
    allow(plane).to receive(:good_weather?).and_return(true)

  end
end

describe Airport do
  it 'responds to plane taking off' do
    expect(subject).to respond_to :takeoff_plane
  end
end
