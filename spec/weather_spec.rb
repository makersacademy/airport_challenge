# This is a weather class rspec that tests random weather pattern
require 'weather'

describe Weather do

  describe '#Forcasts' do
    it 'returns no_fly false' do
    allow(subject).to receive(:rand).and_return(6)
    expect(subject.forcast).to eq false
    end

    it 'returns low_ceiling false' do
    allow(subject).to receive(:rand).and_return(5)
    expect(subject.forcast).to eq false
    end

    it 'returns excelent_weather true' do
    allow(subject).to receive(:rand).and_return(0)
    expect(subject.forcast).to eq true
    end

    it 'returns good_weather true' do
    allow(subject).to receive(:rand).and_return(1)
    expect(subject.forcast).to eq true
    end

    it 'returns acceptable_weather true' do
    allow(subject).to receive(:rand).and_return(2)
    expect(subject.forcast).to eq true
    end

    it 'returns rainy true' do
    allow(subject).to receive(:rand).and_return(3)
    expect(subject.forcast).to eq true
    end

    it 'returns overcast true' do
    allow(subject).to receive(:rand).and_return(4)
    expect(subject.forcast).to eq true
    end

  end

  describe '' do
  end
end
