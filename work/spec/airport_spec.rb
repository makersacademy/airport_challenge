require 'airport'

describe Airport do
  it 'exists!' do
    expect(subject.class).to eq Airport
  end

  it { is_expected.to respond_to(:land).with(1).argument }

    describe '#land' do
      it 'lands a plane at the airport' do
        plane = Plane.new
        subject.land(plane)
        expect(subject.plane).to eq @planes
      end
    end

  it { is_expected.to respond_to(:takeoff) }
end
