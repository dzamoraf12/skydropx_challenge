require 'test_helper'
 
class FedexCreatorTest < ActiveSupport::TestCase
  setup do 
    @fedex_creator = FedexCreator.new
  end

  test "should create SkyFedex object" do
    assert_equal SkyFedex, @fedex_creator.factory.class
  end

  test "should not create diferent type from SkyFedex" do
    assert_not_equal SkyDhl, @fedex_creator.factory.class
  end

  test "the carrier name should be FedEx" do
    assert_equal "FedEx", @fedex_creator.get_name
  end
end