describe Weather do

  subject(:weather) { described_class.new }

  it 'is stormy' do
    allow(weather).to receive(:rand).and_return(1)
    expect(weather).to be_stormy
  end

  it 'is stormy' do
    allow(weather).to receive(:rand).and_return(3)
    expect(weather).not_to be_stormy
  end

end
