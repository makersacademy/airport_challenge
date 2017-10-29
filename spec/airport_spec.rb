require 'airport'

describe Airport do


  subject(:airport) { described_class.new }

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it { is_expected.to respond_to(:stormy?) }

  it 'Confirm the plane has landed' do
    plane = double(:plane)
    expect(subject.land(plane)).to eq [plane]
  end

  it 'Confirm the plane has taken off' do
    plane = double(:plane)
    subject.land(plane)
    expect(subject.take_off(plane)).to eq plane
end
# it "raise an error if weather is stormy" do
#   plane = double(:plane)
#   allow(airport).to receive(:stormy?).and_return true
#   expect { airport.take_off(plane) }.to raise_error(RuntimeError,"It's stormy! We can't fly")
# end

end
