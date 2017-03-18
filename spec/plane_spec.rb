require 'Plane'

describe Plane do

  subject (:airport) { described_class.new }

  describe '#plane_lands' do
    it 'landed plane is not flying' do
      # allow(airport).to receive(:land) { }
      subject.plane_lands
      expect(subject.flying?).to eq false
    end
  end
end
