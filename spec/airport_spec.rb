require 'airport'


RSpec.describe Airport do


  describe '#land' do
    it 'allows planes to land' do
      plane1 = Plane.new
      plane2 = Plane.new
      expect(subject.land(plane1)).to eq [plane1]
      expect(subject.land(plane2)).to eq [plane1, plane2]
    end

    context 'when plane has already landed' do
    it 'raises an error' do
      plane1 = Plane.new
      subject.land(plane1)
      expect { subject.land(plane1)}.to raise_error ('This plane has already landed')

    end
  end
end
  describe '#take_off' do
    it 'allows planes to take-off' do
    plane1 = Plane.new
    plane2 = Plane.new
    subject.land(plane1)
    subject.land(plane2)
    expect(subject.take_off(plane1)). to eq plane1
    expect(subject.take_off(plane2)). to eq plane2
    expect(subject.planes). to eq []
  end
  end





    describe '#current_weather?' do
      it 'is either sunny or stormy' do
      allow(subject).to receive(:current_weather?) { "sunny" }
      expect(subject.current_weather?).to eq "sunny"
      allow(subject).to receive(:current_weather?) { "stormy" }
      expect(subject.current_weather?).to eq "stormy"
      end

      context 'when stormy' do
      it 'raises an error' do
            allow(subject).to receive(:current_weather?) { "stormy" }
            expect { subject.current_weather? }.to raise_error ("This plane cannot take off due to stormy weather.")

      end
    end

end
end
