require 'spec_helper'

describe Airport do

let(:stormy_weather) {double :weather, conditions: "stormy"}
let(:sunny_weather) {double :weather, conditions: "sunny"}

before :each do
  subject.weather = sunny_weather
end

  describe '#Landing' do
    it "lands a plane in the airport and stores it" do
      plane = Plane.new
      expect(subject.land(plane)).to match_array(plane)
    end

    it "only allows flying planes to land" do
      plane = Plane.new
      subject.land(plane)
      expect{subject.land(plane)}.to raise_error "Can't land as already landed"
    end

    it 'errors when the airport is full' do
      Airport::DEFAULT_CAPACITY.times do
        subject.land(Plane.new)
      end
      expect { subject.land(Plane.new) }.to raise_error 'Airport is at capacity'
    end

    it 'errors when at different airport capacities' do
      airport = Airport.new 15
      15.times do
        airport.weather = sunny_weather
        airport.land(Plane.new)
      end
      expect { airport.land(Plane.new) }.to raise_error 'Airport is at capacity'
    end
  end

  describe '#Taking Off' do
    it "only allows grounded planes to take off" do
      plane = Plane.new
      subject.land(plane)
      plane.flying = true
      expect {subject.take_off(plane)}.to raise_error "Can't take off as already flying"
    end

    it "only allows real planes to take off" do
      expect{subject.take_off(Plane.new)}.to raise_error "Can't take off as plane doesn't exist"
    end

    it "allows the plane to take off and leaves the airport" do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.empty?).to eq(true)
    end
  end

  describe '#Weather Testing' do
    it "doesn't allow planes to land in stormy weather" do
      plane = Plane.new
      subject.weather = stormy_weather
      expect{subject.land(plane)}.to raise_error "Can't land in stormy weather"
    end
    it "doesn't allow planes to take off in stormy weather" do
      plane = Plane.new
      subject.land(plane)
      subject.weather = stormy_weather
      expect{subject.take_off(plane)}.to raise_error "Can't take off in stormy weather"
    end
  end
end
