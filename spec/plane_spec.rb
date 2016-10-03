require 'plane'

describe Plane do

let (:plane) {Plane.new}

  it 'should respond to the method landing_to' do
    expect(subject).to respond_to :landing_to
  end
  #same example with new syntax
  it { is_expected.to respond_to :landing_to }
  it { is_expected.to respond_to :landed? }
  it { is_expected.to respond_to :take_off }

  it 'should land at specific airport' do
    airport = Airport.new
    expect(plane.landing_to(airport)).to be airport

  end

end
