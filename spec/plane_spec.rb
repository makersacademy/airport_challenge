require 'plane'

describe Plane do

  describe '#in_air' do
    it { is_expected.to respond_to(:up_in_air) }
  end 

  it 'confirm, has plane has taken off?' do
    airport = Airport.new
    airport.land(subject)
    plane = airport.take_off(subject)
    expect(plane.up_in_air).to eq(true)
  end

  it 'confirm, plane has not taken off?' do
    airport = Airport.new
    airport.land(subject)
    expect(subject.up_in_air).to eq(false)
  end

end