require './lib/Weather.rb'

describe Weather do
  describe '#weather?' do
    it 'should return a random number between 0 and 1' do
      subject.weather?
      expect(subject.forecast).to eq('Stormy').or eq('Calm')
    end
  end

  it 'should return stormy if weather is less than 0.2' do
    allow(subject).to receive(:weather?) { 0.1 }
    expect(subject.forecast).to eq 'Stormy'
  end

  it 'should return calm if weather is greater than or equal to 0.2' do
    allow(subject).to receive(:weather?) { 0.2 }
    expect(subject.forecast).to eq 'Calm'
  end
end
