require 'airport'

describe Airport do

  it 'should respond to the land method' do
    expect(subject).to respond_to(:land)
  end

  it 'should respond to the takeoff method' do
    expect(subject).to respond_to(:takeoff)
  end

    describe '#land' do

      it 'should add plane to an array when given as argument' do
        expect(subject.land("plane")).to eq ["plane"]
      end

    end

    describe '#takeoff' do

      it 'should remove one plane from array' do
        plane = Plane.new
        subject.land(plane)

        expect(subject.takeoff).to be_empty
      end
    end

      describe '#in_airport?' do

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
