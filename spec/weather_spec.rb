describe Weather do
  subject(:weather) { described_class.new }

  it { is_expected.to respond_to(:stormy?) }

  context 'is sunny 3/4 of the time (deterministic seed)' do
    it 'returns stormy ~25% of the time' do
      srand(333)
      expect(weather.stormy?).to be_falsy
      expect(weather.stormy?).to be_falsy
      expect(weather.stormy?).to be_falsy
      expect(weather.stormy?).to be_truthy
      expect(weather.stormy?).to be_truthy
      expect(weather.stormy?).to be_falsy
    end
  end

  # context 'is sunny 3/4 of the time (statistical)' do
  #   it 'returns stormy ~25% of the time' do
  #     count = 0
  #     100.times { count += (weather.stormy? ? 1 : 0) }
  #     expect(20..30).to include count
  #   end
  # end

  # context 'is sunny 3/4 of the time (prescriptive)' do
  #   it 'has options filled with 3/4 false' do
  #     expect(Weather::OPTIONS).to eq [false, false, false, true]
  #   end

  #   it 'uses sample of options to determine not being stormy' do
  #     allow(Weather::OPTIONS).to receive(:sample).and_return false
  #     expect(weather.stormy?).to be_falsy
  #   end
  #   it 'uses sample of options to determine being stormy' do
  #     allow(Weather::OPTIONS).to receive(:sample).and_return true
  #     expect(weather.stormy?).to be_truthy
  #   end
  # end

end
