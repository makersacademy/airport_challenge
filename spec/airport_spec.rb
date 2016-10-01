require './lib/airport'
require './lib/plane'

describe Airport do

let(:plane) { double() }

  it 'receives a plane' do
      expect(subject).to respond_to(:receive_plane).with(1).argument
  end

  it 'stores a received plane' do
    subject.receive_plane(plane)
    expect(subject.planes).to eq([plane])
  end

  it 'stores multiple received planes' do
    subject.receive_plane(plane)
    subject.receive_plane(plane)
    expect(subject.planes).to eq([plane,plane])
  end

end
