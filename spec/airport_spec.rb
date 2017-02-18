require 'airport'

describe Airport do
  # it 'responds to take_off' do
  #   expect(subject).to respond_to :take_off
  # end
  it { is_expected.to respond_to :take_off }
  it { is_expected.to respond_to :land }

  it 'allows planes to take off' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off).to eq plane
  end

  it 'allows planes to land' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it 'shows landed planes' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane).to eq plane
  end

  describe '#take_off' do

    it 'allows a landed plane to take off' do
      plane = Plane.new
      subject.land(plane)
      #we want the same plane that landed to take off again
      expect(subject.take_off).to eq plane
    end

    it 'raises an error when there are no planes available to take off' do
      expect { subject.take_off }.to raise_error "Airport is empty"
    end

  end
end
