require 'airport'

describe Airport do
  it 'instruct a plan to land' do
    expect(subject).to respond_to :land
  end

  # it 'allows plan to land at airport' do
  #   expect(subject.land).to eq "Allowed to land"
  # end

  # it 'lands a plane' do
  #   plane = Plane.new
  #   subject.store(plane)
  #   expect(subject.land). to eq plane
  # end
end

#
# it { is_expected.to respond_to(:store).with(1).argument }
# it { is_expected.to respond_to(:plane) }
#
# #
describe Airport do
  plane = Plane.new
  it 'can land a plane' do
    expect(subject).to respond_to(:store).with(1).argument
  end
  #
  it 'stores something' do
    plane = Plane.new
    expect(subject.store(plane)).to eq plane
  end

  it 'allows stored planes' do
    plane = Plane.new
    subject.store(plane)
    expect(subject.plane).to eq plane
  end

end


describe Airport do
  it 'instruct a plan to take off' do
    expect(subject).to respond_to :take_off
  end

    it 'confirms no longer in the airport' do
      expect(subject.take_off).to eq "Plane has left the airport"
    end

end
