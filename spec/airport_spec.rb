require 'airport'

describe Airport do
  # it 'responds to take_off' do
  #   expect(subject).to respond_to :take_off
  # end
  it { is_expected.to respond_to :take_off }

  it 'allows planes to take off' do
    plane = subject.take_off
    expect(plane).to be_flying
  end

  it 'allows planes to land' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it 'shows that a plane has landed' do
    plane = Plane.new
    subject.land(plane)
    expect(plane).to be_landed
  end

end
