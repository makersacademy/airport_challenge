require 'airport'

describe Airport do

let(:plane) {double :plane, confirmation: 'landed'}

  describe 'landing' do

      it 'lands plane and confirms landing' do
        plane = double(:plane, status: 'landed', confirmation: 'landed')
        weather = double(:weather, condition: false)
        subject.land(plane, weather)
        expect(plane.confirmation).to eq "landed"
      end

      it 'prevents landing when airport is full' do
        plane = double(:plane, status: "")
        weather = double(:weather, condition: false)
        20.times {subject.land(plane, weather)}
        expect {subject.land(plane, weather)}.to raise_error 'cannot land plane, airport full'
      end
  end

  describe 'take_off' do

      it 'allows and confirms take off' do
        plane = double(:plane, status: 'flying', confirmation: 'flying')
        weather = double(:weather, condition: false)
        subject.land(plane, weather)
        subject.take_off(plane, weather)
        expect(plane.confirmation).to eq 'flying'
      end

      context 'when stormy'do
        it 'prevents landing' do
          plane = double(:plane, status: "")
          weather = double(:weather, condition: true)
          expect {subject.land(plane, weather)}.to raise_error 'cannot land, too stormy'
        end

        it 'prevents take off' do
          plane = double(:plane, status: 'landed')
          weather = double(:weather, condition: false)
          subject.land(plane, weather)
          weather = double(:weather, condition: true)
          expect {subject.take_off(plane, weather)}.to raise_error 'cannot take off, too stormy'
      end
    end

  end

    describe 'initialization' do

      it 'has a variable capacity' do
        plane = double(:plane, status: 'flying')
        weather = double(:weather, condition: false)
        airport = Airport.new(30)
        30.times {airport.land(plane, weather)}
        expect {airport.land(plane, weather)}.to raise_error 'cannot land plane, airport full'
      end
    end
end
