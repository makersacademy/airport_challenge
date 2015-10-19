require 'airport.rb'

describe Airport do

  let (:airplane) {Airplane.new}

  describe '#land' do

    it {is_expected.to respond_to(:land).with(1).arguments}

    it "raises error when airport is full" do
      Airport::DEFAULT_CAPACITY.times {subject.land(Airplane.new)}
      expect{subject.land(airplane)}.to raise_error ('Airport is full')
    end

    context "when there is no storm" do
      it "allows airplane to land" do
        plane_double = double("plane")
        allow(subject).to receive(:storm).and_return false
        expect (subject.land).to be true
      end
    end
  end

  describe '#airplane status' do
    it "return status of landed airplane" do
      subject.land(airplane)
      expect(subject.airplane).to eq [airplane]
    end
  end

  describe '#take_off' do
    it {is_expected.to respond_to(:take_off).with(1).arguments}

    it "lets airplane take off from where they land" do
      subject.land(airplane)
      subject.take_off(airplane)
      expect(subject.airplane).to eq []
    end

    it "removes airplane in airport after take off" do
      subject.take_off(airplane)
      expect(subject.airplane).not_to include airplane
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
