require './lib/airport'

describe Airport do
  subject(:airport) { described_class.new(20) }

    it { is_expected.to respond_to(:land).with(1).argument }
    it { is_expected.to respond_to(:take_off).with(1).argument }

  it 'will not let planes land if the capacity is full' do
    20.times do
      airport.land Plane.new
    end
    expect { airport.land Plane.new }.to raise_error "Airport capacity full."
  end
end
