require 'Airport'
describe Airport do
it { is_expected.to respond_to(:land).with(1).argument }

  it 'for planes to land at aiport, instruct plane to land' do
    airport = Airport.new
    plane = Plane.new
    expect { airport.land(plane) }.not_to raise_error
  end
end
