require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  it 'plane location can be set' do
    plane.change_location(:heathrow)
    expect(plane.location).to eq :heathrow
  end

  describe 'errors are raised' do
    it 'while "in transit" planes attempt to take off' do
      message = "cannot take off while plane is in transit"
      expect { plane.flight_check }.to raise_error message
    end

    it 'while "grounded" planes attempt to land' do
      plane.change_location(:heathrow)
      message = "cannot land a plane which is already grounded"
      expect { plane.landing_check }.to raise_error(message)
    end
  end
end
