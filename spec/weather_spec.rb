require 'weather'

describe Weather do

  subject(:weather) { described_class.new }

  it 'has a Weather class' do
    expect(weather).to be_a(Weather)
  end

  it 'responds to \'stormy?\' method' do
    expect(weather).to respond_to(:stormy?)
  end

  it 'returns \'true\' when \'stormy?\' is passed a value of 10' do
    allow(weather).to receive(:random_value) { 10 }
    expect(weather.stormy?).to eq(true)
  end

  it "returns 'false' when 'stormy?' is passed values 1-9" do
    allow(weather).to receive(:random_value).and_return(1,2,3,4,5,6,7,8,9)
    9.times { expect(weather.stormy?).to eq(false) }
  end

end
