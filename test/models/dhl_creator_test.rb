require 'test_helper'
 
class DhlCreatorTest < ActiveSupport::TestCase
  setup do 
    @dhl_creator = DhlCreator.new
  end

  test "should create SkyDhl object" do
    assert_equal SkyDhl, @dhl_creator.factory.class
  end

  test "should not create diferent type from SkyDhl" do
    assert_not_equal SkyFedex, @dhl_creator.factory.class
  end

  test "the carrier name should be DHL" do
    assert_equal "DHL", @dhl_creator.get_name
  end
end