require './lib/airport'
require './lib/plane'

describe Airport do

  it {is_expected.to respond_to :planes}
  it {is_expected.to respond_to(:land).with(1).argument}
  it {is_expected.to respond_to :landed?}
  it {is_expected.to respond_to :take_off}
  it {is_expected.to respond_to :departed?}

  describe '#take_off:' do
    context 'when Airport is empty' do
      it 'does not take_off a Plane object if airport is empty' do
        expect {subject.take_off}.to raise_error("No planes in airport.")
      end
    end

    context 'when weather is stormy' do
      before do
        @planes = [Plane.new]
      end
      it 'prevents a Plane object from taking off' do
        allow(subject).to receive(:weather) { "stormy" } #copied from kat's repo
        expect {subject.take_off}.to raise_error("Plane cannot take off due to stormy weather.")
      end
    end
  end


  describe '#departed?' do
    context 'when Plane object has taken off' do
      it 'provide status of Plane object' do
      allow(subject).to receive(:take_off) { true }
      expect(subject.departed?).to eq true
      end
    end
  end


  describe '#landing:' do
    context 'when weather is stormy' do
      before do
        @plane = Plane.new
      end
      it 'prevents a Plane object from landing' do
        allow(subject).to receive(:weather) { "stormy" }
        expect(subject.land(@plane)).to eq @plane
      end
    end
  end

  describe '#landed?' do

    context 'when Plane object has landed' do
      it 'provide status of Plane object' do
        allow(subject).to receive(:land) { true }
        expect(subject.landed?).to eq true
      end
    end

    context 'when airport is full' do
      it 'raises an error' do
        Airport::DEFAULT_CAPACITY.times do
          subject.land(Plane.new)
        end
      expect {subject.land(Plane.new)}.to raise_error("Airport is full.")
      end
    end

  end

  describe '#planes' do
    before do
      @plane1 = Plane.new
      @plane2 = Plane.new
      subject.land(@plane1)
      subject.land(@plane2)
    end
    it 'returns the array of landed Plane objects' do
      expect(subject.planes).to eq([@plane1, @plane2])
    end
  end


end
