require 'airport'

describe AirPort do
  it "lands planes safely at airport" do
    expect(subject).to respond_to :land_safely
  end
  it "takes off safely at airport" do
    expect(subject).to respond_to :take_off_safely
  end
  it { is_expected.to respond_to(:land_safely).with(1).argument }

 describe '#land_safely' do
   it 'raises a error when theres no room to land' do
    10.times {subject.land_safely Planes.new}
    expect {subject.land_safely Planes.new }.to raise_error 'airport is full'
   end
 end

end
