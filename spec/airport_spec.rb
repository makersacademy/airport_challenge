require 'airport'

describe Airport do

  it { is_expected.to respond_to :take_off }

  # it 'checks if plane has left the airport' do
  #   plane = subject.take_off
  #   expect(plane).to be_left_airport
  # end

  it { is_expected.to respond_to(:land).with(1).argument }

  it 'docks a landing plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  describe '#take_off' do
    it 'releases a plane' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end

    it 'raises an error when there are no planes to take off' do
      expect { subject.take_off }.to raise_error 'No planes available'
    end
  end

end
