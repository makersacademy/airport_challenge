require 'weather'
describe Weather do
  it 'Has a method which will determine weather' do
    expect(subject).to respond_to(:output_weather)
  end
    describe '#output_weather?' do
      it 'returns sunny' do
        allow(subject).to receive(:output_weather).and_return("sunny") 
        expect(subject.output_weather).to eq("sunny")
      end
      it 'returns stormy' do
        allow(subject).to receive(:output_weather).and_return("stormy") 
        expect(subject.output_weather).to eq("stormy")
      end
    end
end