require 'airport'

describe Airport do

    describe '#land' do

      before do
        allow(subject.weather).to receive(:stormy?).and_return(false)
      end

      it 'should add plane to an array when given as argument' do
        expect(subject.land("plane")).to eq ["plane"]
      end

      it 'should not add to planes array when capcity is full' do
        allow(subject).to receive(:full?).and_return(true)
        plane = Plane.new

        expect{subject.land(plane)}.to raise_error 'airport is at full capacity'
      end

    end

    describe '#takeoff' do

      before do
        allow(subject.weather).to receive(:stormy?).and_return(false)
      end

      it 'should remove one plane from array' do
        plane = Plane.new
        subject.land(plane)
        expect(subject.takeoff(plane)).to be_empty
      end

    end

      describe '#in_airport?' do

        before do
          allow(subject.weather).to receive(:stormy?).and_return(false)
        end

        it 'should return true if plane provided is in airport' do
            plane = Plane.new
            subject.land(plane)
          expect(subject.in_airport?(plane)).to eq true
        end

        it 'should return false if plane provided is not in airport' do
            plane = Plane.new
          expect(subject.in_airport?(plane)).to eq false
        end
      end




end
