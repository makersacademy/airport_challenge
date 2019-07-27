require 'airport'
require 'plane'

describe Airport do

  subject(:airport) {described_class.new(10)}
  let(:plane) {double(:plane)}

  describe '#land' do

    it "let's plane to land" do
      allow(airport).to receive(:stormy?).and_return false
      expect(airport).to respond_to(:land).with(1).argument
    end


    context 'when airport is full'do
      it 'stop plane from landing when airport is full' do
        allow(airport).to receive(:stormy?).and_return false
        10.times {airport.land plane}
        expect { airport.land plane}.to raise_error "Full capacity reached! You can not land here."
      end
    end

    context 'when weather is stromy' do
      it "doesn't allow plane to land in stormy weather" do
        allow(airport).to receive(:stormy?).and_return true
        expect {airport.land(plane)}.to raise_error "Stormy weather! You can not land!!"
      end
    end
  end



  describe '#take_off' do
    it {is_expected.to respond_to(:take_off).with(1).argument}
    it "doesn't store plane after it took off" do
      airport.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end
  end

  context 'when weahter is stormy' do
    it "doesn't allow plane to take_off when weahter is stomy" do
      allow(airport).to receive(:stormy?). and_return true
      expect{ airport.take_off(plane) }.to raise_error "Stormy weather! You can not take off!!"
    end
  end
end