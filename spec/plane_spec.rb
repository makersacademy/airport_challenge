require 'plane'

describe Plane do

  it{is_expected.to respond_to(:landed?)}

  it 'can tell if a plane has landed' do
    airport = Airport.new
    airport.land(subject)
    expect(subject.landed?).to eq(true)
  end

end
