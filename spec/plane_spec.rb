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

    it 'holds the airport its at' do
      expect(subject.instance_variable_get(:@docked_at)).to eq(airport)
    end

  end

  context 'works with takeoff method by' do

    before do
      subject.land(bristol)
    end

    it 'resets the associated airport to nil' do
      subject.takeoff(bristol)
      expect(subject.instance_variable_get(:@docked_at)).to be_nil
    end

  end

end
