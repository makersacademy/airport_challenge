require 'plane.rb'

describe Plane do
  context 'flying status' do
    it 'has status of "landed" when on the ground' do
      expect(subject.status).to eq 'landed'
    end

    it 'has status of "flying" after takeoff' do
      subject.status = 'flying'
      expect(subject.status).to eq 'flying'
    end
  end
end
