require 'airport'

describe Airport do

  it { is_expected.to respond_to :allow_landing }

  it 'allows plane to land' do
    plane = subject.allow_landing
    expect(plane).to be_landed
  end

  it 'confirms landing' do
    plane = subject.allow_landing
    expect(plane.landed?).to eq true
  end

end
