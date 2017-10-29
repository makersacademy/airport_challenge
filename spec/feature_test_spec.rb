#!/usr/bin/env ruby

require 'aeroplane'
require 'airport'
require 'air_exceptions'

describe "feature tests" do
  
  # airport that's always clear - we don't want random errors
  let(:port) { Airport.new(weather: Weather.new(0), capacity: 50) }

  describe "behaves properly with stormy weather" do
    context "airport that's always stormy" do
      it "should always prevent any take-off or landing" do
        port = Airport.new(weather: Weather.new(1))
        # should be able to dock without problems
        5.times { Aeroplane.new(at: port) }
        # cannot land!
        expect { Aeroplane.new.land(port) }.to raise_error AirportError
        # cannot take off!
        expect { port.hangar[0].take_off }.to raise_error AirportError
      end
    end

    context "should eventually be stormy with default weather" do
      it "raises an AirportError at some point" do
        # we should expect a storm long before this airport is full
        port = Airport.new(capacity: 1000)
        counter = 0
        # add aeroplanes until a storm is encountered
        while counter < 1000
          begin
            Aeroplane.new.land(port)
            counter += 1
          rescue AirportError
            break
          end
        end
        # if the counter reaches 1000, we hit the capacity limit
        expect(counter).to be < 1000
      end
    end
  end

  describe "can confirm that aeroplanes have left" do
    context "docked aeroplane leaves" do
      it "uses #include? to confirm aeroplane departure" do
        plane = Aeroplane.new(at: port)
        plane.take_off
        expect(port).to_not include plane
      end
    end
  end

  describe "aeroplanes ignore silly instructions" do
    context "flying aeroplanes" do
      it "raises error when instructed to take off" do
        expect { Aeroplane.new.take_off }.to raise_error AeroplaneError
      end
    end

    context "docked aeroplanes" do
  
      subject { Aeroplane.new(at: port) }

      it "raises error when landing while docked, at same airport" do
        expect { subject.land(port) }.to raise_error AeroplaneError
      end

      it "raises error when landing while docked, at other airport" do
        expect { subject.land(Airport.new) }.to raise_error AeroplaneError
      end
    end
  end

  describe "airport can fill to capacity" do
    context "check that stormy weather never occurs" do
      it "never gets stormy weather" do
        expect((0..1000).map { port.stormy? }.any?).to be false
      end
    end

    context "can add exactly the airport capacity" do
      it "adds 50 aeroplanes before raising an error" do
        50.times { Aeroplane.new.land(port) }
        expect { Aeroplane.new.land(port) }.to raise_error AirportError
      end
    end
  end

  describe "airport gets aeroplanes through docking or landing" do
    context "add docked and landed aeroplanes" do
      it "has occupancy of 2" do
        Aeroplane.new(at: port)
        Aeroplane.new.land(port)
        expect(port.occupancy).to eq 2
      end
    end
  end

  describe "airport loses aeroplanes through take-off" do
    context "loses 1 of 10 aeroplanes" do
      it "has occupancy of 9" do
        10.times { Aeroplane.new(at: port) }
        port.hangar[0].take_off
        expect(port.occupancy).to eq 9
      end
    end
  end
end
