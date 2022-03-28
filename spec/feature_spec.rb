require 'airport'

describe 'Planes flying around different stations' do
  it 'Three planes flying around three stations' do
    airport1 = Airport.new
    airport2 = Airport.new
    airport3 = Airport.new
    allow(airport1).to receive(:stormy?).and_return(false)
    allow(airport2).to receive(:stormy?).and_return(false)
    allow(airport3).to receive(:stormy?).and_return(false)
    plane1 = Plane.new
    plane2 = Plane.new
    plane3 = Plane.new
    airport1.land(plane1)
    airport2.land(plane2)
    airport3.land(plane3)
    airport2.take_off(plane2)
    airport1.land(plane2)
    airport1.take_off(plane1)
    airport3.take_off(plane3)
    airport2.land(plane3)
    airport3.land(plane1)
    expect(airport1.planes.include?(plane2)).to eq true
    expect(airport2.planes.include?(plane3)).to eq true
    expect(airport3.planes.include?(plane1)).to eq true
  end
end
