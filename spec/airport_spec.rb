require 'airport'
require 'plane'


describe Airport do
  describe '#land' do

    it 'respond to land method with one argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end

  end

  describe '#take_off' do
    it {is_expected.to respond_to :take_off}

    it "doesn't containt plane that already took off" do
      airplane = Plane.new
      airport = Airport.new
      airport.take_off(airplane)
      expect(subject.planes).not_to include(airplane)
    end
  end
end