require 'airport'
require 'plane'
describe Airport do
  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
    it 'the plane can be landed when the weather is sunny' do
      subject.stormy = false
      expect { subject.land(double(:plane)) }.not_to raise_error
    end
    it "the plane can't be landed when the weather is stormy" do
      subject.stormy = true
      expect { subject.land(double(:plane)) }.to raise_error("The plane can't be landed - it is stormy")
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }
    it 'the plane can take off when the weather is sunny' do
      subject.stormy = false
      expect { subject.take_off(double(:plane)) }.not_to raise_error
    end
    it "the plane can't be landed when the weather is stormy" do
      subject.stormy = true
      expect { subject.take_off(double(:plane)) }.to raise_error("The plane can't take off - it is stormy")
    end
  end

  it 'the weather can be changed to stormy' do
    subject.stormy = true
    expect(subject.stormy?).to eq true
  end
end
