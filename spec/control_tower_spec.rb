require 'control_tower'

describe ControlTower do
  subject(:control_tower) { described_class.new }
  let(:plane) { double(:plane) }
  let(:airport) { double(:airport) }

  it 'can create an instance of ControlTower class' do
    expect(control_tower).to be_instance_of(ControlTower)
  end

  context 'in acceptable weather' do
    before(:each) do
      allow(control_tower).to receive(:adverse_conditions?).and_return(false)
    end

    it 'issues an order to take-off successfully' do
      expect(plane).to receive(:take_off).once
      expect(airport).to receive(:dispatch).once
      control_tower.order_take_off(plane, airport)
    end

    it 'issues an order to land successfully' do
      expect(plane).to receive(:land).once
      expect(airport).to receive(:receive).once
      control_tower.order_landing(plane, airport)
    end
  end

  context 'in poor weather' do
    before(:each) do
      allow(control_tower).to receive(:adverse_conditions?).and_return(true)
    end

    it 'fails to issue take-off order' do
      expect { control_tower.order_take_off(plane, airport) }.to raise_error 'cannot take off in stormy conditions'
    end

    it 'fails to issue landing order' do
      expect { control_tower.order_landing(plane, airport) }.to raise_error 'cannot land in stormy conditions'
    end
  end
end
