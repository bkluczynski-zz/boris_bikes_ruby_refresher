require "docking_station"

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it "releases a bike" do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'docks something' do
    bike = Bike.new
    # We want to return the bike we dock
    expect(subject.dock(bike)).to eq bike
  end

  # let's update our test for #bike
  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    # Again, we need to return the bike we just docked
    expect(subject.bike).to eq bike
  end


end
