require "docking_station"

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it "releases a bike when there is a bike available" do
    bike = Bike.new
    station = DockingStation.new
    station.dock(bike)
    station.release_bike(bike)
    expect(bike).to be_working
  end

  it 'docks something' do
    bike = Bike.new
    # We want to return the bike we dock
    expect(subject.dock(bike)).to eq [bike]
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'raises error when there is no bikes available' do
    expect { subject.release_bike(Bike.new) }.to raise_error("Sorry, there are no bikes available for hire")
  end

  it 'has a default capacity of 20 bikes' do
    DockingStation::DEFAULT_CAPACITY.times { subject.dock Bike.new }
    expect { subject.dock(Bike.new) }.to raise_error("Sorry, there are no free slots to dock a bike")
  end

  it 'does not release broken bike' do
    bike = Bike.new
    bike.report_broken
    subject.dock(bike)
    expect { subject.release_bike(bike) }.to raise_error("Sorry, this bike is broken")
  end



end
