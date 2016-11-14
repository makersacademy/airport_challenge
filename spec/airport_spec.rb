require 'airport'
require 'plane'
require 'weatherstub'


describe Airport do

  subject(:airport) {described_class.new(1, GoodWeatherStub.new)}
  subject(:stormy_airport) {described_class.new(1, BadWeatherStub.new)}
  subject(:airport_for_2) {described_class.new(2, GoodWeatherStub.new)}

  let(:plane) {double :plane}
  let(:plane2) {double :plane}


  before (:each) {allow(plane).to receive(:land)}
  before (:each) {allow(plane).to receive(:take_off)}
  before (:each) {allow(plane2).to receive(:land)}
  before (:each) {allow(plane2).to receive(:take_off)}

  subject (:good_weather) {GoodWeatherStub.new}
  subject (:bad_weather) {BadWeatherStub.new}




  context "should confirm that the plane " do

    it "has not landed" do
      expect(airport.landed?(plane)).to eq false
    end

    it "has landed" do

      airport.authorize_landing(plane)
      expect(airport.landed?(plane)).to eq true
    end


    it "has already landed, when we try to land again" do
        airport_for_2.authorize_landing(plane)
        message = "The plane has already landed"
        expect{airport_for_2.authorize_landing(plane)}.to raise_error message
    end

    it "cannot land if the airport is at full capacity" do
      
      airport.authorize_landing(plane)
      expect(airport.authorize_landing(plane2)).to eq "The airport is full, can not land"
    end

    it "won't takes off if it hasn't landed in the airport" do
      message = "The plane hasn't landed here."
      expect{airport.authorize_take_off(plane)}.to raise_error message
    end
  end

  context "should instruct the plane " do
    it "to take off if weather conditions are good" do
      airport.authorize_landing(plane)
      airport.authorize_take_off(plane)
      expect(airport.landed?(plane)).to eq false
    end


  end


  context "should have a default capacity " do
    it "when no other indicated" do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "overriden if a value is passed" do
      expect(airport_for_2.capacity).to eq 2
    end
  end

context "In stormy weather " do



it "cannot land because of stormy weather" do

    expect(stormy_airport.authorize_landing(plane)).to eq "Can not land in stormy weather"
end

it "not to take off if weather conditions are stormy" do
  allow_any_instance_of(Weather).to receive(:conditions).and_return(:good)
  airport.authorize_landing(plane)
  allow_any_instance_of(Weather).to receive(:conditions).and_return(:stormy)
  message = "Can not take off in stormy weather"
  expect(stormy_airport.authorize_take_off(plane)).to eq message
end

  end


  it "expect to raise error when airport at full capacity" do
  end
end
