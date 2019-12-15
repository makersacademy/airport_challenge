require 'airport'

describe Airport do

    it 'allow plane to land at aiport' do
        plane = Plane.new
        expect(subject.land(plane)).to eq [plane]
    end

    it 'allow plane to take-off' do
        plane = Plane.new
        expect(subject.take_off(plane)).to be nil
    end
end