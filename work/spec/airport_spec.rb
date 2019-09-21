require 'airport'

describe Airport do
  it 'exists!' do
    expect(subject.class).to eq Airport
  end

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:takeoff) }
end
