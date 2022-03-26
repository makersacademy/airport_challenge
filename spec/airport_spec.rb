require_relative '../lib/airport'

describe Airport do

  let(:plane) { double :plane }

  it "Checks object is an instance of Airport" do
    expect(subject).to be_an_instance_of(Airport)
  end

  it '#store_plane' do
    expect(subject).to respond_to :store_plane
  end

  it '#store_plane - Store plane object in hangar during sunny weather conditions' do
    allow(subject).to receive(:weather) { "sunny" }
    subject.store_plane(plane)
    expect(subject.hangar).to include(plane)
  end

  it '#remove_plane_from_hangar' do
    expect(subject).to respond_to :remove_plane_from_hangar
  end

  it '#remove_plane_from_hangar - Remove plane from airport hangar' do
    allow(subject).to receive(:weather) { "sunny" }
    subject.store_plane(plane)
    expect(subject.remove_plane_from_hangar(plane)).not_to include(plane)
  end

  it '#remove_plane_from_hangar - Raise error when removing plane that is not stored at airport' do
    allow(subject).to receive(:weather) { "sunny" }
    subject.store_plane('')
    expect { subject.remove_plane_from_hangar(plane) }.to raise_error("The plane is not stored at this airport")
  end

  it '#full?' do
    expect(subject).to respond_to :full?
  end

  it '#full? - Allow plane to land if airport is not full' do
    allow(subject).to receive(:weather) { "sunny" }
    subject.store_plane(plane)
    expect(subject.full?).to be_falsey
  end
  it '#full? - Do not allow plane to land if airport is full' do
    allow(subject).to receive(:weather) { "sunny" }
    6.times { subject.store_plane(plane) }
    expect { subject.full? }.to raise_error("The airport is full, you cannot land here")
  end

  it '#full? - Allow more planes to land than default capacity (5) if overridden' do
    airport = Airport.new(10)
    allow(airport).to receive(:weather) { "sunny" }
    11.times { airport.store_plane(plane) }
    expect { airport.full? }.to raise_error("The airport is full, you cannot land here")
  end

  it 'Prevent plane from take off during stormy weather' do
    allow(subject).to receive(:weather) { "stormy" }
    expect { subject.remove_plane_from_hangar(plane) }.to raise_error("You cannot take off during stormy weather")
  end

  it 'Prevent plane from landing during stormy weather' do
    allow(subject).to receive(:weather) { "stormy" }
    expect { subject.store_plane(plane) }.to raise_error("You cannot land during stormy weather")
  end

end 
