require 'plane'

describe Plane do
  it 'plane location can be set' do
    subject.change_location(:heathrow)
    expect(subject.location).to eq :heathrow
  end

  describe 'errors are raised' do
    it 'while "in transit" planes attempt to take off' do
      message = "cannot take off while plane is in transit"
      expect{subject.flight_check}.to raise_error message
    end

    it 'while "grounded" planes attempt to land' do
      subject.change_location(:heathrow)
      message = "cannot land a plane which is already grounded"
      expect{subject.landing_check}.to raise_error(message)
    end
  end
end