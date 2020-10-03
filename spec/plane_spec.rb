require 'plane'

describe Plane do
  let(:airbus747) { Plane.new }
  let(:luton_airport) { Airport.new }

  it { is_expected.to respond_to :asking_for_permission? }

  it 'landing' do
    airbus747.landing_at(luton_airport)
    expect(luton_airport.hangar).to include(airbus747)
  end

  it 'taking off' do
    airbus747.landing_at(luton_airport)
    airbus747.taking_off_from(luton_airport)
    expect(luton_airport.hangar).not_to include(airbus747)
  end

end
