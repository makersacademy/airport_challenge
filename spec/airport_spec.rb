require 'airport'
require 'plane'


describe Airport do
  subject(:airport) {described_class.new(10)}
  let(:plane) {double(:plane)}

  describe '#land' do

    it "let's plane to land" do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it 'stop plane from landing when airport is full' do
      plane = double (:plane)
      10.times {airport.land plane}
      expect { airport.land plane}.to raise_error "Full capacity reached! You can not land here."
    end

  end

  describe '#take_off' do
    it {is_expected.to respond_to(:take_off).with(1).argument}

    it "doesn't store plane after it took off" do
      airport.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end
  end
end