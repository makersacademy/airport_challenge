require 'airport'
require 'weather'

describe Airport do

  describe '#initialze' do

    it 'should show the planes on the ground' do
      expect(subject).to respond_to(:onground)
    end

    it { is_expected.to respond_to(:inair) }

    it 'should show the capactiy' do
      expect(subject).to respond_to(:capacity)
    end

    it 'the default capacity should be 20' do
      expect(subject.capacity).to eq 20
    end

  end

  describe '#land' do

    it { is_expected.to respond_to(:land) }

=begin

    it "be able to accept 20 planes" do
      weather = Weather.new
      allow(weather).to receive(:stormy?) { false }
      20.times { subject.land(Plane.new) }
    end
=end

  end

=begin

    it 'should say it\'s too stormy to land' do
      plane = Plane.new
      weather = instance_double('weather',:stormy? => true)
      expect { subject.land(plane) }.to raise_error "it's too stormy to land!"
    end

  end

    it "says it's too stormy to land" do
      plane = Plane.new
      expect { subject.land(plane) }.to raise_error "it's too stormy to land!"
    end

    it "should say it's full" do
      21.times { subject.land(Plane.new) }.to raise_error "sorry, the airport is full"
    end
=end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }
  end

  describe '#full' do
    it { is_expected.to respond_to(:full?) }
  end
end
