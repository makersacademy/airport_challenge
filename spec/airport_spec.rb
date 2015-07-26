require 'airport'



describe Airport do

  let (:plane) {double(:plane)}

  describe 'take off' do

    it 'instructs a plane to take off' do
      expect(subject).to respond_to(:release_plane)
    end

    it 'releases a plane' do
      allow(subject).to receive(:stormy?) {false}
      allow(plane).to receive(:land) {plane}
      subject.land_plane(plane)
      allow(plane).to receive (:take_off) {plane}
      expect(subject.release_plane).to be plane
    end

    it 'does not release planes when airport is empty' do
      expect{subject.release_plane}.to raise_error 'Airport is empty, no planes available'
    end

   

  end

  describe 'landing' do
    it 'instructs a plane to land' do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end

    it 'receives a plane' do
    allow(plane).to receive(:land) {plane}
    allow(subject).to receive(:stormy?) {false}
    expect(subject.land_plane plane).to be plane
    end
  end

  # let(:plane_full) {double(:plane_full, {:stormy? => false })}

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        allow(subject).to receive(:stormy?) {false}
        allow(plane).to receive(:land) {plane}
        subject.capacity.times{subject.land_plane(plane)}
        expect{subject.land_plane(plane)}.to raise_error 'Airport is full, plane cannot land'
      end
    end
    
    # let(:stormy_plane) {double(:stormy_plane, {:stormy? => true, land=> true })}

    context 'when weather conditions are stormy' do
      it 'does not allow a plane to be released' do
        allow(plane).to receive(:land) {plane}
        allow(subject).to receive(:stormy?) {false}
        subject.land_plane (plane)
        allow(subject).to receive(:stormy?) {true}
        allow(plane).to receive(:take_off) {plane}
        expect{subject.release_plane}.to raise_error 'Weather is too stormy to take off'
      end
       
     
      it 'does not allow a plane to land' do
        allow(plane).to receive(:land) {plane}
        allow(subject).to receive(:stormy?) {true}
        expect{subject.land_plane(plane)}.to raise_error 'Weather is too stormy to land' 
      end
    end
  end
end
