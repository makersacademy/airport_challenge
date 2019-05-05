require 'airports'

describe Airport do
  let(:plane) { Plane.new }

  def not_stormy
    allow(subject.weather).to receive(:stormy?) { false }
  end

  def stormy
    allow(subject.weather).to receive(:stormy?) { true }
  end

  def land_process
    subject.land(plane)
  end

  def take_off_process
    subject.take_off(plane)
  end

  describe 'capacity' do
    it 'should have a default value if no argument given' do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end

    it 'should override default capacity when given an argument' do
      random_number = rand(1..100)
      expect(Airport.new(random_number).capacity).to eq(random_number)
    end
  end

  context 'when it is not stormy' do
    before(:each) do
      not_stormy
    end

    describe '#land' do
      it 'should store landed planes' do
        land_process
        expect(subject.planes.include?(plane)).to eq(true)
      end

      it 'should not be able to land planes if airport is at capacity' do
        subject.capacity.times { subject.land(Plane.new) }
        message = 'Airport at capacity'
        expect { land_process }.to raise_error message
      end

      it 'should not be able to land a plane if it is already landed' do
        land_process
        message = 'The plane is already landed somewhere'
        expect { land_process }.to raise_error message
      end
    end

    describe '#take_off' do
      it 'should not contain planes which have just taken off' do
        land_process
        take_off_process
        expect(subject.planes.include?(plane)).to eq(false)
      end

      it 'should not take off non-existent planes' do
        message = 'The plane is not landed here'
        expect { take_off_process }.to raise_error message
      end
    end
  end

  context 'when it is stormy' do
    describe '#land' do
      it 'should not be able to land planes' do
        stormy
        message = 'Too stormy to land'
        expect { land_process }.to raise_error message
      end
    end

    describe '#take_off' do
      it 'should not be able to take off planes' do
        not_stormy
        land_process
        stormy
        message = 'Too stormy to take off'
        expect { take_off_process }.to raise_error message
      end
    end
  end
end
