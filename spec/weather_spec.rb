require 'weather'

describe Weather do
  subject(:weather) {described_class.new}

  it 'is expected to sometimes be stormy' do
    allow(weather).to receive(:storms_coming).and_return(true)
    expect(weather).to be_stormy
  end

  it 'is expected to sometimes not be stormy' do
    allow(weather).to receive(:storms_coming).and_return(false)
    expect(weather).not_to be_stormy
  end

end
