require 'plane'
describe Plane do
  subject(:plane) {plane = Plane.new}
  let(:airport) {airport = Airport.new}

  it {should respond_to(:land).with(1).argument}

  it 'should be able to confirm that it has landed' do
  plane.land(airport)
  expect(plane.landed?).to eq true
  end

end

