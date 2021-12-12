require 'airport'
require 'plane'
require 'weather'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  
  it { is_expected.to respond_to :check_weather }
  
  it "has a defualt capacity" do
    expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

  it "default capacity can be overwritten for new airports" do
    london_heathrow = Airport.new(50)
    expect(london_heathrow.capacity).to eq 50
  end

  describe "#instruct_landing" do
    context 'when weather is sunny' do
      before do
        allow(airport).to receive(:check_weather).and_return('Sunny')
      end

      it { is_expected.to respond_to(:instruct_landing).with(1).argument }

      it "returns plane after landing" do
        expect(airport.instruct_landing(plane)).to eq(plane)
      end

      context "when Plane has already landed at the Airport" do
        it "raises error" do
          airport.instruct_landing(plane)
          expect { airport.instruct_landing(plane) }.to raise_error "ERROR: PLANE HAS ALREADY SAFELY LANDED"
        end
      end

      context 'when airport is full' do
        it "raises an error" do
          airport.capacity.times { airport.instruct_landing(Plane.new) }
          expect { airport.instruct_landing(plane) }.to raise_error "ERROR: AIRPORT AT FULL CAPACITY!"
        end
      end
    end

    context 'when weather is stormy' do
      it "raises an error" do
        london_heathrow = Airport.new
        allow(london_heathrow).to receive(:check_weather).and_return('Stormy')
        expect { london_heathrow.instruct_landing(plane) }.to raise_error "STORMY WEATHER: CANNOT LAND"
      end
    end
  end

  describe "#instruct_take_off" do
    context "when weather is sunny" do
      before do 
        allow(airport).to receive(:check_weather).and_return('Sunny')
      end

      it { is_expected.to respond_to(:instruct_take_off) }
      
      it "can instruct a plane to take_off" do
        airport.instruct_landing(plane)
        expect(airport.instruct_take_off(plane)).to eq(plane)
      end

      it "raises error if user tries to instruct_take_off a plane which is not in airport" do
        gatwick = Airport.new(100)
        gatwick.instruct_landing(plane)
        expect { airport.instruct_take_off(plane) }.to raise_error "TAKE-OFF ERROR: PLANE NOT HERE"
      end
    end
    
    context "when weather is stormy" do
      it "raises error" do
        allow(airport).to receive(:check_weather).and_return('Stormy')
        expect { airport.instruct_take_off(plane) }.to raise_error "STORMY WEATHER: CANNOT TAKE OFF"
      end
    end
  end
end
