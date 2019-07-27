require 'airport'
require 'plane'
require 'weather_report'

describe Airport do

  subject(:airport) {described_class.new(described_class::DEFAULT_CAPACITY)}
  let(:plane) {double(:plane)}
  let(:weahter_report) {double :weahter_report}

  describe "#initializer" do
    it 'has a default capacity that can be changed' do
      airport = Airport.new(14)
      expect(airport.capacity).to eq 14
    end
  end

  describe '#land' do

    context 'weather not stormy' do
      before do
        allow(weahter_report).to receive(:stormy?).and_return false
      end
      it "plane land" do
        expect(airport).to respond_to(:land).with(1).argument
      end
      context 'when airport is full'do
      it 'stop plane from landing' do
        10.times {airport.land plane}
        expect { airport.land plane}.to raise_error "Full capacity reached! You can not land here."
      end
    end
    end

    context 'when weather is stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return true
      end
      it "doesn't allow plane to land" do
        expect {airport.land(plane)}.to raise_error "Stormy weather! You can not land!!"
      end
    end
  end


  describe '#take_off' do
    context 'weahter is not stormy' do
    it {is_expected.to respond_to(:take_off).with(1).argument}
    it "remove stored plane after take off" do
      allow(airport).to receive(:stormy?). and_return false
      airport.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end
    end

    context 'when weahter is stormy' do
      it "doesn't allow plane to take_off" do
        allow(airport).to receive(:stormy?). and_return true
        expect{ airport.take_off(plane) }.to raise_error "Stormy weather! You can not take off!!"
      end
    end

  end
end