require './lib/airport.rb'
require './lib/weather.rb'

describe Airport do

  describe "#takeoff" do
    it 'airport responds to takeoff' do
      expect(subject).to respond_to(:takeoff).with(1).argument
    end

    it "causes error when no planes at airport to takeoff"  do
      expect { subject.takeoff Airport.new }.to raise_error "No planes to take off"
    end
  end

  describe "#land" do
    it "airport responds to land" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "causes error when trying to land in full airport"  do
      subject.capacity.times { subject.land(Airport.new) }
      expect { subject.land Airport.new }.to raise_error "Can't land, airport full"
    end

  end
end
