require 'weather'

describe Weather do

  it 'is expected to create new weather object' do
    expect(subject.is_a? Weather).to eq true
  end

  it { is_expected.to respond_to :stormy? }

  it 'returns true or false when executing #stormy?' do
    expect(subject.stormy?).to eq(true) .or eq(false)
  end

end
