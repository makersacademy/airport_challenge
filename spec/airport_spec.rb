require 'airport'
require 'plane'


describe Airport do
  subject(:airport) {described_class.new(10)}

  describe '#land' do

    it 'respond to land method with one argument' do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it 'prevent landing when airport full capacity is reached' do
      plane = Plane.new
      10.times {airport.land plane}
      expect { airport.land plane}.to raise_error "Full capacity reached! You can not land here."
    end

  end

  describe '#take_off' do
    it {is_expected.to respond_to(:take_off).with(1).argument}

    it "doesn't containt plane that already took off" do
      plane = Plane.new
      airport.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end
  end
end