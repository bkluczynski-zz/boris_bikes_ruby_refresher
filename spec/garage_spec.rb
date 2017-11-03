require 'garage'

describe Garage do

  bike = Bike.new

  it 'has a dedicated space to repair bikes' do
    expect(subject.bikes.length).to eq(0)
  end

  it 'repairs broken bikes' do
    bike.report_broken
    brokenBikes = [];
    brokenBikes << bike
    expect { subject.repair_bikes(brokenBikes) }.to change { bike.working? }.from(false).to(true)
  end


end
