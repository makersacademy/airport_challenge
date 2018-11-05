require './lib/airport'

describe Airport do
  subject { Airport.new }
  let (:plane) { double(:plane) }
  let (:weather) { double(:weather) }


  describe '#land plane' do
    it 'allows planes to land' do
      subject.land(plane)
      expect(subject.hangar).to include(plane)
    end
  end

  describe '#take_off plane' do
    before do
      allow(weather).to receive(:stormy?).and_return(false)
    end
    it 'allows planes to take off when the weather is not stormy' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.hangar).not_to include(plane)
    end

    before do
      allow(weather).to receive(:stormy?).and_return(true)
    end
    it 'fails to allow a plane to take off when the weather is stormy' do
       subject.land(plane)
       expect { (subject.land(plane)) }.to raise_error "Airplanes cannot land due to stormy weather."
    end
  end
end
