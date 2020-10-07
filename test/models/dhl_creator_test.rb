require 'test_helper'
 
class DhlCreatorTest < ActiveSupport::TestCase
  test "should create SkyDhl object" do
    dhl_creator = DhlCreator.new
    assert_equal SkyDhl, dhl_creator.factory.class
  end

  test "should not create diferent type from SkyDhl" do
    dhl_creator = DhlCreator.new
    assert_not_equal SkyFedex, dhl_creator.factory.class
  end

  test "the carrier name should be DHL" do
    dhl_creator = DhlCreator.new
    assert_equal "DHL", dhl_creator.get_name
  end
end