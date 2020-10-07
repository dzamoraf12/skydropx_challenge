require 'test_helper'
 
class FedexCreatorTest < ActiveSupport::TestCase
  test "should create SkyFedex object" do
    fedex_creator = FedexCreator.new
    assert_equal SkyFedex, fedex_creator.factory.class
  end

  test "should not create diferent type from SkyFedex" do
    fedex_creator = FedexCreator.new
    assert_not_equal SkyDhl, fedex_creator.factory.class
  end

  test "the carrier name should be FedEx" do
    fedex_creator = FedexCreator.new
    assert_equal "FedEx", fedex_creator.get_name
  end
end