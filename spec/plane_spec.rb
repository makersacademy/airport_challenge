# give each plane an ascending designation, aswell as a construction time.
require 'airport_challenge'

describe Plane do

  describe '#designation' do
    it { is_expected.to respond_to(:desig) }
    it 'starts with letters "MA"' do
      expect(subject.desig[0..1]).to eq("MA")
    end
    it 'gives sequential designations to each new plane' do
      first = Plane.new
      second = Plane.new
      expect(second.desig[2..-1].to_i - first.desig[2..-1].to_i).to eq(1)
    end
  end

end
