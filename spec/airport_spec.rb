require 'airport'

describe Airport do
  let(:plane) {double :plane, is_landed: true}

  describe 'land' do

    it 'expects the plane to land into the airport when weather is fine' do
      allow(subject).to receive(:is_stormy?).and_return(false)
      subject.land(plane)
      expect(subject.list_planes).to include(plane)
    end

    it 'expects landing to be prevented when weather is stormy' do
      allow(subject).to receive(:is_stormy?).and_return(true)
      expect{subject.land(plane)}.to raise_error "It's too stormy to land."
    end

  end

  describe 'takeoff' do

    it 'expects the plane to take off from the airport when weather is fine' do
      allow(plane).to receive(:took_off).and_return(true)
      allow(subject).to receive(:is_stormy?).and_return(false)
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.list_planes).to eq([])
    end

    it 'expects takeoff to be prevented when weather is stormy' do
      allow(plane).to receive(:took_off).and_return(true)
      allow(subject).to receive(:is_stormy?).and_return(true)
      subject.land(plane)
      expect{subject.takeoff(plane)}.to raise_error "It's too stormy to take-off."
    end

  end

end
