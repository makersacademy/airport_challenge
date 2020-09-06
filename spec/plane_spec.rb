require 'plane'

class AirportDouble
end

describe Plane do

  subject(:plane) { Plane.new }
  let(:airport) { AirportDouble.new }

  describe '#land(airport)' do
    it { should respond_to(:land).with(0).arguments }

    it 'returns true if the plane is in the air' do
      expect(subject.land).to eq true
    end

    it "updates plane status to 'landed'" do
      subject.land
      expect(subject.status).to eq(:landed)
    end

    it 'raises error if the plane is already on the ground' do
      subject.land
      expect { subject.land }.to raise_error('Plane is already on the ground')
    end
  end

end