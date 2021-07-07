require 'airport'

describe Airport do
  subject { Airport.new }

  DEFAULT_CAPACITY = 1
  HIGH_CAPACITY = 2

  let(:high_capacity_airport) { Airport.new(HIGH_CAPACITY) }
  let(:plane) { double("Plane") }
  let(:plane1) { double("Plane") }

  let(:weather_error_message) { 'DANGER: Storm Forecast' }
  let(:capacity_error_message) { 'Airport at capacity' }

  before do
    allow_any_instance_of(Airport).to receive(:the_weather) { :sunny }
    allow(plane).to receive(:docked_at) { nil }
    allow(plane1).to receive(:docked_at) { nil }
    subject.landing(plane)
    allow(plane).to receive(:docked_at) { subject }
  end

  context 'works with landing method by' do

    it 'adds the plane to the airport class' do
      expect(subject.instance_variable_get(:@planes)).to include(plane)
    end

    it "won't allow landing when aiport is full" do
      expect { subject.landing(plane1) }.to raise_error(capacity_error_message)
    end

    it 'will take a capacity of 20' do
      allow(plane).to receive(:docked_at) { nil }
      high_capacity_airport.landing(plane)
      expect { high_capacity_airport.landing(plane1) }.to_not raise_error(capacity_error_message)
    end

    it 'raises error when landing a plane that is at another airport' do
      message = "Plane already docked at another airport"
      expect { high_capacity_airport.landing(plane) }.to raise_error(message)
    end

  end

  context 'works with depart method by' do

    it 'removes plane from airport when departs' do
      subject.depart(plane)
      expect(subject.instance_variable_get(:@planes)).not_to include(plane)
    end

    it 'removes plane from airport when departs and tells user it has left' do
      message = "#{plane} has left the airport\nNo planes now docked #{subject}\n"
      expect { subject.depart(plane) }.to output(message).to_stdout
    end

    it 'raises and error when departing from the wrong airport' do
      message = "Plane not docked at #{high_capacity_airport}"
      expect { high_capacity_airport.depart(plane) }.to raise_error(message)
    end

  end

  context 'weather error checks' do

    before do
      allow(subject).to receive(:the_weather) { :stormy }
    end

    it 'does not allow depart when stormy' do
      expect { subject.depart(plane) }.to raise_error(weather_error_message)
    end

    it 'does not allow landing when stormy' do
      expect { subject.landing(plane) }.to raise_error(weather_error_message)
    end

  end

end
