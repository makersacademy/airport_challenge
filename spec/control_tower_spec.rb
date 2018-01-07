require 'control_tower'

describe ControlTower do
  subject(:control_tower) { described_class.new }
  let(:plane) { double(:plane) }
  let(:airport) { double(:airport) }

  it 'can create an instance of ControlTower class' do
    expect(subject).to be_instance_of(ControlTower)
  end

  context 'when issuing take-off orders' do
    it 'issues an order successfully' do
      expect(plane).to receive(:take_off).once
      expect(airport).to receive(:dispatch).once
      allow(subject).to receive(:adverse_conditions?).and_return(false)
      subject.order_take_off(plane, airport)
    end

    it 'fails to issue order in adverse weather' do
      allow(subject).to receive(:adverse_conditions?).and_return(true)
      expect { subject.order_take_off(plane, airport) }.to raise_error 'cannot take off in stormy conditions'
    end
  end

  context 'when issuing landing orders' do
    it 'issues an order successfully' do
      expect(plane).to receive(:land).once
      expect(airport).to receive(:receive).once
      allow(subject).to receive(:adverse_conditions?).and_return(false)
      subject.order_landing(plane, airport)
    end

    it 'fails to issue an order in adverse weather' do
      allow(subject).to receive(:adverse_conditions?).and_return(true)
      expect { subject.order_landing(plane, airport) }.to raise_error 'cannot land in stormy conditions'
    end
  end
end
