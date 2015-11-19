require 'plane'

describe Plane do
  subject(:plane) {described_class.new}
  let (:airport) {double :airport}

  describe '#take_off' do
    it {is_expected.to(respond_to(:take_off))}
    it 'raises and error if already flying' do
      expect {plane.take_off}.to raise_error 'Plane cannot take off: plane is already flying.'
    end
  end

  describe '#airport' do
    it {is_expected.to(respond_to(:airport))}
    it 'raises an error if already flying' do
      expect {plane.airport}.to raise_error 'Plane cannot be at the airport: plane is already flying.'
    end
  end

  describe '#land' do
    it 'stores the airport the plane landed at' do
      plane.land(airport)
      expect(plane.airport).to eq airport
    end
    it 'raises an error if already landed' do
      plane.land(airport)
      expect {plane.land(airport)}.to raise_error 'Plane cannot land: plane is already landed.'
    end
  end
  # it 'checks that the plane is flying when initialized' do
  #   expect(plane.flying?).to eq(true)
  # end
  #
  # it 'checks if plane is not flying when it is landed' do
  #   subject.land
  #   expect(subject.flying?).to eq(false)
  # end
  #
  # it 'checks if plane is flying when it takes off' do
  #   subject.take_off
  #   expect(subject.flying?).to eq(true)
  # end
end
