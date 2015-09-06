require 'plane'

describe Plane do

  # When we create a new plane, it should be "flying"

  it 'is flying when created' do
    expect(subject).to be_flying
  end

  describe 'take-off behaviour:' do

    # I would like to be able to take off from the appropriate airport

    it { is_expected.to respond_to(:take_off_from).with(1).argument }

    it 'can take off from an airport when given permission' do
        airport = double :airport, permission_to_take_off?: true
        expect{subject.take_off_from(airport)}.not_to raise_error
    end

    it 'cannot take off from an airport when denied permission' do
        airport = double :airport, permission_to_take_off?: false
        expect{subject.take_off_from(airport)}.to raise_error 'Permission denied'
    end

    # When the plane takes of from the airport, it should be "flying" again

    it 'is flying after take off' do
      airport = double :airport, permission_to_take_off?: true
      subject.take_off_from(airport)
      expect(subject).to be_flying
    end

  end

  describe 'landing behaviour:' do

    # I would like to land my plane at the appropriate airport

    it { is_expected.to respond_to(:land_at).with(1).argument }

    it 'can land at an airport when given permission' do
        airport = double :airport, permission_to_land?: true
        expect{subject.land_at(airport)}.not_to raise_error
    end

    it 'cannot land at an airport when denied permission' do
        airport = double :airport, permission_to_land?: false
        expect{subject.land_at(airport)}.to raise_error 'Airport is full'
    end

    # When we land a plane at the airport, it should be "landed"

    it 'is landed at an airport after landing' do
      airport = double :airport, permission_to_land?: true
      subject.land_at(airport)
      expect(subject).to be_landed_at(airport)
    end

  end

end

# Think about your implementation - does it allow a plane to be "flying"
# and landed? Are you testing that?

# >> I'm not testing that, but as it happens the way I've implemented
# >> 'flying?' and 'landed_at?' makes them mutually exclusive.
