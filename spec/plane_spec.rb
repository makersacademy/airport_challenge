require 'Plane'

describe Plane do

  subject (:airport) { described_class.new }

  describe '#plane_lands' do
    it 'plane is initially flying' do
      expect(subject.flying?).to eq true
    end
  end

  describe '#plane_lands' do
    it 'landed plane is not flying' do
      subject.plane_lands
      expect(subject.flying?).to eq false
    end
  end

  describe '#plane_takes_off' do
    it 'after taking-off, plane is flying' do
      subject.plane_takes_off
      expect(subject.flying?).to eq true
    end
  end
end
