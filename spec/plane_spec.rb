require './lib/plane'
require './lib/airport'

describe Plane do

  let(:airport) { double() }

    it 'can land', focus: :true do
      subject.land
      expect(subject.landed).to eq true
    end

end
