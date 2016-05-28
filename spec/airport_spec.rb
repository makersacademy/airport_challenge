require 'airport'

describe Airport do 

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  let(:plane) { double(:plane) }

  it 'allows a flying plane to land' do
    #plane = double(:plane, flying?: true)
    expect(subject.land(plane)).to eq "The plane has landed"
  end
  it 'allows a plane to take-off' do
    #plane = double(:bike, landed?: true)
    expect(subject.take_off(plane)).to eq "The plane has taken off"
  end

end