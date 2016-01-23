require 'plane'

describe Plane do
  it { is_expected.to respond_to :status }

  it 'shows status of landed plane to be arrived' do
    airport = Airport.new
    airport.land subject
    expect(subject.status).to eq "arrived"
  end

end