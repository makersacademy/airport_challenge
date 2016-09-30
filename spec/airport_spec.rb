require "airport"

describe Airport do

  let(:plane) { double :plane }

  it 'allows a plane to land' do
      expect(subject.land(plane)).to eq plane
  end

  it 'allows a plane to takeoff' do
      expect(subject.takeoff(plane)).to eq plane
  end

end
