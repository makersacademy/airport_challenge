require "airport"

describe Airport do

  #it 'accepts planes' do
  #  plane = Plane.new
  #  expect(subject.accept(plane)).to be_instance_of(Plane)
  #end

  it {is_expected.to respond_to(:weather_stormy?)}

  it 'prevents takeoff and landing in stormy weather' do
    allow(subject.deny_plane).to receive(:weather_stormy?){1}.and_return ('Airport closed due to stormy weather')
  end

  describe "#accept_plane" do
    it 'raises an error when airport is full' do
    #  50.times subject.accept_plane(Plane.new)
      expect {subject.accept_plane(Plane.new)}.to raise_error 'Airport full'
    end
  end

end
