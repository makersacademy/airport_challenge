require 'airport.rb'
require 'weather.rb'

describe Airport do

  subject(:airport) { described_class.new(weather)}
  let (:airplane) { double :plane }
  let (:weather) { double :weather}

  describe '#landing' do

    context "when there is no storm" do
      before do

        allow(weather).to receive(:stormy?).and_return(false)
      end

      it {is_expected.to respond_to(:land).with(1).arguments}

      it "raises error when airport is full" do
        Airport::DEFAULT_CAPACITY.times {airport.land(Airplane.new)}
        expect{airport.land(airplane)}.to raise_error ('Airport is full')
      end

      describe '#airplane status' do
        it "return status of landed airplane" do
          airport.land(airplane)
          expect(airport.airplane).to eq [airplane]
        end
      end
    end

    context "when there is a storm" do
      it "does not allow planes to land" do
        allow(weather).to receive(:stormy?).and_return(true)
        expect{airport.land(airplane)}.to raise_error ('Cannot land plane: weather is stormy')
      end
    end
  end


  describe '#take_off' do
    context 'when there is no storm' do
      before do
        allow(weather).to receive(:stormy?).and_return(false)
      end

    it {is_expected.to respond_to(:take_off).with(1).arguments}

    it "lets airplane take off from where they land" do
      airport.land(airplane)
      airport.take_off(airplane)
      expect(airport.airplane).to eq []
    end

    it 'raises an error if plane is not at this airport' do
      other_airport = described_class.new(weather)
      other_airport.land(airplane)
        expect { airport.take_off(airplane) }.to raise_error 'Cannot take off plane: plane not at this airport'
    end

    it "removes airplane in airport after take off" do
      airport.land(airplane)
      airport.take_off(airplane)
      expect(airport.airplane).not_to include airplane
    end
  end

    context "when there is a storm" do
      it "does not allow plane to take off"do
        allow(weather).to receive(:stormy?).and_return(true)
        expect{airport.take_off(airplane)}.to raise_error ('Cannot take off plane: weather is stormy')
      end
    end

  end

  describe '#capacity'do
    it "has a default capacity" do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe 'initialization'do
    it "has a variable capacity that can override default" do
      airport = Airport.new(10)
      expect(airport.capacity).to eq 10
    end
  end
end
