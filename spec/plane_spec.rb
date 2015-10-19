require 'plane'

describe Plane do

  context 'plane is flying' do
    it 'plane is flying' do
      plane = Plane.new
      expect(subject.flying).to eq true
    end
  end
end
