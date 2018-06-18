require "airport.rb"
describe Airport do
  let(:plane) { double(:plane) }

  describe '#land' do

    it { should respond_to(:land).with(1).argument }

    it 'allows planes to land' do
      subject.land(plane)
      expect(subject.planes).to include plane
    end
    it "raises an error when full" do
      subject.capacity.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error "Runway full"
  end

  describe "#take_off" do

    it { should respond_to(:take_off).with(1).argument }
    it "allows planes to take off" do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to_not include plane
    end
  end
end

  describe "#initialize" do

    it "it has a default capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'has a variable capacity' do
      airport = Airport.new(50)
      50.times { airport.land Plane.new }
      expect{ airport.land Plane.new }.to raise_error 'Runway full'
    end
  end
end