require 'weather'

describe Weather do

  subject(:weather) { described_class.new }

  it 'responds to status' do
    expect(weather).to respond_to :status
  end

  it 'varies' do
    allow(weather).to receive(:status).and_return(:sunny, :stormy, :sunny)
    expect(weather.status).to eq :sunny
    expect(weather.status).to eq :stormy
    expect(weather.status).to eq :sunny
  end

end
