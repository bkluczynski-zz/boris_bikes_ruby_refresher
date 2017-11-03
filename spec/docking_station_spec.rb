require "docking_station"

describe DockingStation do

  let(:bike) { double :bike }
  let(:bike2){ double :bike2 }

  it { is_expected.to respond_to :release_bike }

  it "releases a bike when there is a bike available" do
    allow(bike).to receive(:broken?).and_return(false)
    subject.dock(bike)
    expect(subject.release_bike(bike)).to be bike
  end

  it 'docks something' do
    # We want to return the bike we dock
    expect(subject.dock(bike)).to eq [bike]
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'raises error when there is no bikes available' do
    expect { subject.release_bike(bike) }.to raise_error("Sorry, there are no bikes available for hire")
  end

  it 'has a default capacity of 20 bikes' do
    DockingStation::DEFAULT_CAPACITY.times { subject.dock bike }
    expect { subject.dock(bike) }.to raise_error("Sorry, there are no free slots to dock a bike")
  end

  it 'does not release broken bike' do
    allow(bike).to receive(:broken?).and_return(true)
    subject.dock(bike)
    expect { subject.release_bike(bike) }.to raise_error("Sorry, this bike is broken")
  end

  it 'can accept a broken bike' do
    allow(bike).to receive(:broken?).and_return(true)
    expect(subject.dock(bike)).to eq [bike]
  end

  it 'can return all broken bikes' do
    allow(bike).to receive(:working?).and_return(true)
    8.times { subject.dock bike }
    allow(bike2).to receive(:working?).and_return(false)
    9.times { subject.dock bike2 }
    expect(subject.release_broken_bikes.length).to be(9)
    expect(subject.count_bikes).to be(8)
  end


end
