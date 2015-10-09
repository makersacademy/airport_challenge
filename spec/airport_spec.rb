require 'airport'

describe Airport do
  let(:plane){ double :plane, land: :false }

  it 'can instruct a plane to take off' do
    expect(subject).to respond_to(:take_off)
  end

  it 'can instruct a plane to land' do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end

  context 'when a plane lands' do
    before {
      allow(subject).to receive(:weather).and_return("sunny")
      subject.land_plane(plane)
    }

    it 'aircraft_count increases by 1' do
      expect(subject.aircraft_count.count).to eq(1)
    end

    it 'airport contains that plane' do
      expect(subject.aircraft_count).to include plane
    end

  end

  it 'Traffic Control does not allow a plane to land at full capacity' do
    allow(subject).to receive(:weather).and_return("sunny")
    subject.capacity.times {subject.land_plane(plane)}
    expect{subject.land_plane plane}.to raise_error 'Airport at full capacity'
  end

  context "when stormy" do
    before { allow(subject).to receive(:weather).and_return("stormy") }

    it 'Does not allow a plane to take off when stormy' do
      expect{subject.take_off(plane)}.to raise_error("There is a storm, the plane cannot land!")
    end

    it 'Does not allow a plane to land during a storm' do
      expect{subject.land_plane plane}.to raise_error("There is a storm, the plane cannot land!")
    end

  end

end
