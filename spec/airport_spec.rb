require 'Airport'
require 'Plane'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }

  it 'returns a success message when we land a plane' do
    expect(subject.land(Plane.new)).to eq "Plane landed"
  end

  it { is_expected.to respond_to :planes}

  it 'returns no planes when airport is empty' do
    expect(subject.planes).to eq nil
  end

  it 'returns a plane when I check what has landed' do
    my_plane = Plane.new
    subject.land(my_plane)
    expect(subject.planes).to eq my_plane
  end

  it { is_expected.to respond_to(:take_off) }
end
