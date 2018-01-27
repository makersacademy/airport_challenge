require 'plane'

describe Plane do

  it {is_expected.to respond_to(:land).with(1).argument}
  it {is_expected.to respond_to(:take_off)}

  describe '#land' do
    it 'lands self at an airport' do
      airport = double('airport',:planes => [])
      subject.land(airport)
      expect(airport.planes).to include(subject)
    end
  end

  describe '#take_off' do
    let(:plane){Plane.new}
    let(:airport){double('airport',:planes => [])}
    it 'takes off from its current airport' do
      plane.land(airport)
      plane.take_off
      expect(airport.planes).to eql([])
    end

    it 'confirms self is no longer at the airport' do
      plane.land(airport)
      plane.take_off
      expect{plane.take_off}.to output('Plane has left airport').to_stdout
    end
  end

end
