require 'airport'

describe Airport do
  let(:airbus) { double :plane}
  it { is_expected.to respond_to :instruct_land }
  it { expect(subject).to respond_to(:instruct_land).with(1).argument }
  it { is_expected.to respond_to :instruct_takeoff }
  it { expect(subject).to respond_to(:instruct_takeoff).with(1).argument }
  it { is_expected.to respond_to(:confirm_gone?) }
  it { expect(subject).to respond_to(:confirm_gone?).with(1).argument }

  it 'instructs a plane to land' do
    # airbus = P:plane}
    expect(subject.instruct_land(airbus)).to eq(airbus) 
  end

  it 'instructs a plane to take-off' do
    expect(subject.instruct_takeoff(airbus)).to eq(airbus) 
  end

  it 'checks the plane has really gone away after take-off' do
    subject.instruct_land(airbus)
    subject.instruct_takeoff(airbus)
    expect(subject.confirm_gone?(airbus)).to eq(true)
  end

end
