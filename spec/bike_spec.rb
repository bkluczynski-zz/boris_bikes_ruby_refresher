require "bike.rb"

describe Bike do
  it { is_expected.to respond_to :working? }

  it "is working" do
  bike = Bike.new
  expect(bike).to be_working
  end

  it "can be broken" do
  bike = Bike.new
  bike.report_broken
  expect(bike).to be_broken
  end



end
