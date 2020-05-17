require 'airport'

describe Airport do
  subject { Airport.new }

  DEFAULT_CAPACITY = 10
  HIGH_CAPACITY = 20

  let(:high_capacity_airport) { Airport.new(HIGH_CAPACITY) }
  let(:plane) { double("Plane") }

  before do
    allow_any_instance_of(Airport).to receive(:the_weather) { "clear" }
    subject.landing(plane)
  end

  context 'works with landing method by' do

    it 'airport responds to landing method and takes an argument' do
      expect(subject).to respond_to(:landing).with(1).argument
    end

    it 'adds the plane to the airport class' do
      expect(subject.instance_variable_get(:@planes)).to include(plane)
    end

    it "won't allow landing when aiport is full" do
      (DEFAULT_CAPACITY - 1).times { subject.landing(plane) }
      expect { subject.landing(plane) }.to raise_error('Airport at capacity')
    end

    it 'will take a capacity of 20' do
      HIGH_CAPACITY.times { high_capacity_airport.landing(plane) }
      expect { high_capacity_airport.landing(plane) }.to raise_error('Airport at capacity')
    end

  end

  context 'works with depart method by' do

    it 'removes plane from airport when departs' do
      subject.depart(plane)
      expect(subject.instance_variable_get(:@planes)).not_to include(plane)
    end

    it 'removes plane from airport when departs and tells user it has left' do
      expect { subject.depart(plane) }.to output("#{plane} has left the airport\nNo planes now docked #{subject}\n").to_stdout
    end

  end

  context 'weather error checks' do

    before do
      allow(subject).to receive(:the_weather) { "stormy" }
    end

    it 'does not allow depart when stormy' do
      expect { subject.depart(plane) }.to raise_error('DANGER: Storm Forecast')
    end

    it 'does not allow landing when stormy' do
      expect { subject.landing(plane) }.to raise_error('DANGER: Storm Forecast')
    end

  end

end
