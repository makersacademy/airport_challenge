require 'plane'

describe Plane do

  it { is_expected.to respond_to (:landed?) }

  it 'confirms it has landed after landing' do
    airport = Airport.new
    airport.land(subject)
    expect(subject.landed?).to be(true)
  end

end
