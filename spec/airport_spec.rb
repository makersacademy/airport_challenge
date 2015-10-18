require 'airport.rb'

describe Airport do

  describe '#landing' do

    it "raises error when airport is full" do
      Airport::DEFAULT_CAPACITY.times {subject.land(Airplane.new)}
      expect{subject.land(Airplane.new)}.to raise_error ('Airport is full')
    end
  end

  describe '#airplane' do
    it "return status of landed airplane" do
      airplane = Airplane.new
      subject.land(airplane)
      expect(subject.airplane).to eq [airplane]
    end
  end

  describe '#take_off' do
      it "lets airplane take off from where they land" do
        airplane = Airplane.new
        subject.take_off(airplane)
        expect(subject.airplane).to eq []
      end
  end

  describe '#capacity'do
    it "has a default capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end
  describe 'initialization'do
    it "has a variable capacity that can override default" do
      airport = Airport.new(10)
      expect(airport.capacity).to eq 10
    end
  end
end
