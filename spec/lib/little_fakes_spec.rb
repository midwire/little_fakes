require File.dirname(__FILE__) + '/../spec_helper'

describe LittleFakes::SSHSessionDouble do
  include LittleFakes

  it "should return the 'bogus_id' data" do
    with_little_fake("successful-lookup-{bogus_id=2279791}.ascii", true) do
      lambda {
        Net::SSH.start('localhost', ENV['USER']) do |session|
          session.exec!('ls -l')
        end
      }.should_not raise_error
    end.should match(/^BOGUS_ID=2279791/)
  end

  it "should return the 'case_number' data" do
    with_little_fake("successful-lookup-{case_number=574491}.ascii", true) do
      lambda {
        Net::SSH.start('localhost', ENV['USER']) do |session|
          session.exec!('ls -l')
        end
      }.should_not raise_error
    end.should match(/^CASE_NUMBER=574491/)
  end

  it "should return the 'id' data" do
    with_little_fake("successful-lookup-{id=134183}.ascii", true) do
      lambda {
        Net::SSH.start('localhost', ENV['USER']) do |session|
          session.exec!('ls -l')
        end
      }.should_not raise_error
    end.should match(/^ID=134183/)
  end
end
