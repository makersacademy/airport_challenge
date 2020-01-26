require 'airport'

# subject(:airport)

describe Airport do
  it 'checks an airport exists' do
    expect(Airport).to be_truthy 
  end

  it { is_expected.to respond_to :take_off }

  it { is_expected.to respond_to(:land).with(1).argument }

  describe '#land' do
    it 'raises an error if airport is full' do
      plane = Plane.new
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error "Airport full"
    end
  end
end

    # it 'lets plane take off' do
    #     plane = Plane.new
    #     subject.take_off(Plane.new)
    # end
