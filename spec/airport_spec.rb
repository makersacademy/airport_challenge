require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :takeoff}

describe '#land' do
  it 'instructs plane to land' do
    subject.land(Plane.new)
    expect { subject.land plane }.to eq [plane]
  end

  it 'raises an error when full' do
    20.times { subject.land Plane.new }
    expect { subject.land Plane.new }.to raise_error 'Airport full!'
  end
end

describe '#takeoff' do
  it 'instructs plane to take off' do
    subject.land Plane.new
    expect { subject.takeoff plane }.to eq []
  end
end

  it 'raises an error when no planes' do
    expect { subject.takeoff plane }.to raise_error 'No planes here!'
  end

end
