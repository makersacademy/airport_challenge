require 'weather'

describe Weather do
  let(:weather) { double :weather } 
  it { is_expected.to respond_to :status }
  it { is_expected.to respond_to :random }
  it "should return either 'sunny' or 'stormy'" do
    allow(weather).to receive(:random).and_return('sunny','stormy')
  end
  it "should return 'sunny' when sunny" do
    allow(weather).to receive(:status) { 'sunny' }
    expect(weather.status).to eq 'sunny'
  end
  it "should return 'stormy' when stormy" do
    allow(weather).to receive(:status) { 'stormy' }
    expect(weather.status).to eq 'stormy'
  end

end
