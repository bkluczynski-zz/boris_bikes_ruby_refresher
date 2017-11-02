require 'van'

describe Van do

  let(:bike) { double :bike }
  let(:bike2){ double :bike2 }
  station = DockingStation.new

  it 'has storage to store bikes' do
    expect(subject.bikes_storage.length).to be(0)
  end

  it 'stores broken bikes' do
    allow(bike).to receive(:working?).and_return(true)
    7.times { station.dock bike }
    allow(bike2).to receive(:working?).and_return(false)
    9.times { station.dock bike2 }
    subject.receive_broken_bikes(station.release_broken_bikes)
    expect(subject.bikes_storage.length).to be(9)
  end

end
