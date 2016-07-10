require "airport"

describe Airport do

  it {is_expected.to respond_to(:weather_stormy?)}

  it 'prevents takeoff and landing in stormy weather' do
    allow(subject.deny_plane).to receive(:weather_stormy?){1}.and_return ('Airport closed due to stormy weather')
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe "#accept_plane" do
    it 'raises an error when airport is full' do
      50.times {subject.accept_plane(Plane.new)}
      expect {subject.accept_plane(Plane.new)}.to raise_error 'Airport full'
    end
  end

end
