require './lib/airport'
require './lib/plane'

describe Airport do
  it { is_expected.to be_instance_of(Airport) }
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:hangar) }
  describe '#land' do
    it 'raises error if land unavailable' do
      plane = double(:plane)
      expect { subject.land(plane) }.to raise_error 'Unable to land'
    end
    # it 'lands plane safely' do
    #   plane = double(:plane)
    #   subject.land(plane)
    #   expect(subject.hangar).to include plane
    # end
    describe '#takeoff' do
      it 'raises error if takeoff unavailable' do
        expect { subject.takeoff }.to raise_error 'Unable to takeoff'
      end
    end
  end
end
