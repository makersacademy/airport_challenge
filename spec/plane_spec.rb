require 'plane'

describe Plane do
  it 'is able to receive instruction to land' do
    expect(subject).to respond_to :clear_to_land?
    Airport.new
    plane = Plane.new
    atc = AirTrafficController.new(plane)
    atc.instruct
    expect(plane).to be_clear_to_land
  end
  it 'is able to land' do
    expect(subject).to respond_to :land
    expect(subject.land).to be true
  end
end
