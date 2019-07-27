require 'airport'
require 'plane'


describe Airport do

  describe '#land' do

    it 'respond to land method with one argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'prevent landing when airport full capacity is reached' do
      airport = Airport.new(10)
      10.times {airport.land Plane.new}
      expect { airport.land Plane.new}.to raise_error "Full capacity reached!"
    end

  end

  describe '#take_off' do
    it {is_expected.to respond_to(:take_off).with(1).argument}

    it "doesn't containt plane that already took off" do
      airplane = Plane.new
      airport = Airport.new
      airport.take_off(airplane)
      expect(subject.planes).not_to include(airplane)
    end
  end
end