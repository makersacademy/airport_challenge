require 'airport'

describe Airport do
  let(:plane) {double(:plane)}

  it 'allows planes to land' do
    expect(subject.land(plane)).to eq([plane])
  end

  it 'allows planes to takeoff' do
    subject.land(plane)
    expect(subject.takeoff(plane)).to eq(plane)
  end

  describe '#land' do
    let(:plane1){double(:plane1)}
    it 'prevents planes landing when airport is full' do
      subject.land(plane1)
      expect{subject.land(plane)}.to raise_error("This airport is full")
    end
  end
end
