require 'airport'

# subject(:airport)

describe Airport do
  it 'checks an airport exists' do
    expect(Airport).to be_truthy 
  end

  it { is_expected.to respond_to :take_off }

  it { is_expected.to respond_to(:land).with(1).argument }

  it 'returns landed plane' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane).to eq plane
  end

  describe '#take_off' do
    it 'tells plane to take off' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end

    it 'raises an error when there are no planes in the airport' do
      expect { subject.take_off }.to raise_error 'No planes in airport'
    end
  end
end

    # it 'lets plane take off' do
    #     plane = Plane.new
    #     subject.take_off(Plane.new)
    # end
