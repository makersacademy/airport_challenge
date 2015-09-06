require 'plane'

describe Plane do

  it 'is flying when created' do
    expect(subject).to be_flying
  end

  describe 'take-off behaviour:' do

    it { is_expected.to respond_to(:take_off_from).with(1).argument }

    it 'can take off from an airport when given permission' do
        airport = double :airport, permission_to_take_off: :ok
        expect{ subject.take_off_from(airport) }.not_to raise_error
    end

    it 'cannot take off when denied permission because of storms' do
        airport = double :airport, permission_to_take_off: :stormy
        expect{ subject.take_off_from(airport) }.to raise_error 'Too stormy'
    end

    it 'is flying after take off' do
      airport = double :airport, permission_to_take_off: :ok
      subject.take_off_from(airport)
      expect(subject).to be_flying
    end

  end

  describe 'landing behaviour:' do

    it { is_expected.to respond_to(:land_at).with(1).argument }

    it 'can land at an airport when given permission' do
        airport = double :airport, permission_to_land: :ok
        expect{ subject.land_at(airport) }.not_to raise_error
    end

    it 'cannot land when denied permission because airport is full' do
        airport = double :airport, permission_to_land: :full
        expect{ subject.land_at(airport) }.to raise_error 'Airport is full'
    end

    it 'cannot land when denied permission because of storm' do
        airport = double :airport, permission_to_land: :stormy
        expect{ subject.land_at(airport) }.to raise_error 'Too stormy'
    end

    it 'is landed at an airport after landing' do
      airport = double :airport, permission_to_land: :ok
      subject.land_at(airport)
      expect(subject).to be_landed_at(airport)
    end

  end

end
