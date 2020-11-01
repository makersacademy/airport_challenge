require_relative '../lib/weather'

describe Weather do
  context 'Weather environment for planes' do
    it 'sets stormy as true when 1 is rolled' do
      allow(subject).to receive(:stormy?).and_return(true)
    end
  end
end
