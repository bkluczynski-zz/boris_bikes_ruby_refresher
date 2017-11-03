require 'garage'
require 'van'

describe Garage do

  bike = Bike.new
  garage = Garage.new
  van = Van.new

  it 'has a dedicated space to repair bikes' do
    expect(subject.bikes.length).to eq(0)
  end

  it 'repairs broken bikes' do
    bike.report_broken
    van.bikes_storage << bike
    van.deliver_bikes_to=(garage)
    expect { garage.repair_bikes }.to change { bike.working? }.from(false).to(true)
  end




end
