require 'airport'
require 'plane'
require 'weather'

describe "User stories" do

      let(:london) {Airport.new(3)}
      let(:paris) {Airport.new(3)}
      let(:p1) {Plane.new}
      let(:p2) {Plane.new}
      let(:p3) {Plane.new}
      let(:p4) {Plane.new}
      let(:p5) {Plane.new}

      before do
        allow(london).to receive(:stormy?).and_return(false)
        allow(paris).to receive(:stormy?).and_return(true)
        london.land_plane(p1)
        london.land_plane(p2)
        paris.planes << p5
      end

      it 'expects planes to be in an airport when landed' do
        expect(london.planes).to include p1
      end

      it 'expects an airport to report full capacity' do
        london.land_plane(p3)
        expect{london.land_plane(p4)}.to raise_error(RuntimeError)
      end

      it 'expects an airport to refuse to land plane already on the ground' do
        expect{london.land_plane(p2)}.to raise_error(RuntimeError)
      end

      it 'expects an airport to refuse a plane when it\'s stormy' do
        expect{paris.land_plane(p4)}.to raise_error(RuntimeError)
      end

      it 'expects a plane to leave an airport when it\'s sent' do
        london.send_plane(p2)
        expect(london.planes).to_not include p2
      end

      it 'expects an airport to refuse to send a plane when it\'s stormy' do
        expect{paris.send_plane(p5)}.to raise_error(RuntimeError)
      end

      it 'expects an airport to refuse to send plane already airborne' do
        london.send_plane(p2)
        expect{london.send_plane(p2)}.to raise_error(RuntimeError)
      end

end
