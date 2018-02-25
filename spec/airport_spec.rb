require 'airport'

describe Airport do

  it { is_expected.to respond_to :take_off }

  it 'checks if plane has left the airport' do
    plane = subject.take_off
    expect(plane).to be_left_airport
  end

  it { is_expected.to respond_to(:land).with(1).argument }

  it 'docks a landing plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

# turning #plane method into attribute reader the below is not needed
  #  it { is_expected.to respond_to :plane }

  # it 'returns the plane that landed' do
  #   plane = Plane.new
  #   subject.land(plane)
  #   expect(subject.plane).to eq plane
  # end

end
