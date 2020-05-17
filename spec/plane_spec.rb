require 'plane'

describe Plane do
  subject { Plane.new }

  let(:airport) { double("airport") }
  let(:bristol) { double("airport") }

  before do
    allow(airport).to receive(:landing)
    allow(airport).to receive(:depart)
    
    allow(bristol).to receive(:landing)
    allow(bristol).to receive(:depart)
  end

  it 'not associated to an airport when created' do
    expect(subject.instance_variable_get(:@docked_at)).to be_nil
  end

  context 'works with landing method by' do

    before do
      subject.land(airport)
    end

    it 'responds to land method with one argument' do
      expect(subject).to respond_to(:land)
    end

    it 'holds the airport its at' do
      expect(subject.instance_variable_get(:@docked_at)).to eq(airport)
    end

  end

  it 'raises error when trying to land but already at an airport' do
    subject.land(bristol)
    expect { subject.land(airport) }.to raise_error("Plane already docked at #{bristol}")
  end

  context 'works with takeoff method by' do

    before do
      subject.land(bristol)
    end

    it 'responds to take_off method with one argument' do
      expect(subject).to respond_to(:takeoff)
    end

    it 'resets the associated airport to nil' do
      subject.takeoff(bristol)
      expect(subject.instance_variable_get(:@docked_at)).to be_nil
    end

    it 'raises error when trying to take off airport not docked at' do
      expect { subject.takeoff(airport) }.to raise_error("Plane not docked at #{airport}")
    end

  end

end
