require './lib/airport'
require './lib/plane'

describe Airport do

  it {is_expected.to respond_to :planes}
  it {is_expected.to respond_to(:land).with(1).argument}
  it {is_expected.to respond_to :take_off}
  it {is_expected.to respond_to :weather}


  describe '#take_off:' do
    context 'when Airport is empty' do
      it 'does not take_off a Plane object if airport is empty' do
        expect {subject.take_off}.to raise_error("No planes in airport.")
      end
    end

    context 'when weather is stormy' do
      before do
        airport = Airport.new
      end
      it 'prevents a Plane object from taking off' do
        allow(subject).to receive(:empty?) { false }
        allow(subject).to receive(:weather) { "stormy" }
        expect {subject.take_off}.to raise_error("Plane cannot take off due to stormy weather.")
      end
    end
  end



  describe '#land(plane):' do
    context 'when weather is stormy' do
      before do
        @plane = Plane.new
      end
      it 'prevents a Plane object from landing' do
        allow(subject).to receive(:full?) { false }
        allow(subject).to receive(:weather) { "stormy" }
        expect {subject.land(@plane)}.to raise_error("Plane cannot land due to stormy weather.")
      end
    end

    context 'when airport is full' do
      it 'raises an error' do
        Airport::DEFAULT_CAPACITY.times do
          allow(subject).to receive(:weather) { "sunny" }
          subject.land(Plane.new)
        end
      expect {subject.land(Plane.new)}.to raise_error("Airport is full.")
      end
    end
  end

  describe '#planes' do
    before do
      airport = Airport.new
      @plane1 = Plane.new
      @plane2 = Plane.new
      allow(subject).to receive(:weather) { "sunny" }
      subject.land(@plane1)
      subject.land(@plane2)
    end
    it 'returns the array of landed Plane objects' do
      expect(subject.planes).to eq([@plane1, @plane2])
    end
  end

  it 'returns the weather\'s status' do
    allow(subject).to receive(:weather) { "sunny" }
    expect(subject.weather).to eq("sunny")
  end


end
