require 'plane.rb'

describe Plane do
  context 'flying status' do
    it 'has status of "landed" when on the ground' do
      expect(subject.status).to eq 'landed'
    end

    it 'has status of "flying" after takeoff' do
      subject.take_off
      expect(subject.status).to eq 'flying'
    end

    it 'has status of "landed" after being instructed to land' do
      subject.take_off
      subject.land
      expect(subject.status).to eq 'landed'
    end
  end
end
