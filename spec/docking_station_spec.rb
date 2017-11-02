require "docking_station"

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it "releases a bike when there is a bike available" do
    bike = Bike.new
    station = DockingStation.new
    station.dock(bike)
    station.release_bike
    expect(bike).to be_working
  end

  it 'docks something' do
    bike = Bike.new
    # We want to return the bike we dock
    expect(subject.dock(bike)).to eq [bike]
  end

  # let's update our test for #bike
  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    # Again, we need to return the bike we just docked
    expect(subject.bikes[0]).to eq bike
  end

  it 'raises error when there is no bikes available' do
    expect { subject.release_bike }.to raise_error("Sorry, there are no bikes available for hire")
  end

  it 'has a default capacity of 20 bikes' do
    20.times { subject.dock Bike.new }
    expect { subject.dock(Bike.new) }.to raise_error("Sorry, there are no free slots to dock a bike")
  end

end
