require 'weather'

describe Weather do

  subject(:weather) {Weather.new}

  it 'responds to stormy?' do
    expect(weather).to respond_to :stormy?
  end
  it 'returns true for stormy weather' do
    # use a stub to fake a result from :rand
    allow(weather).to receive(:rand) {9}
    expect(weather).to be_stormy
  end
  it 'returns false for sunny weather' do
    # use a stub to fake a result from :rand
    allow(weather).to receive(:rand) {1}
    expect(weather).to_not be_stormy
  end

end