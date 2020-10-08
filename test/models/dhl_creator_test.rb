require 'test_helper'
 
class DhlCreatorTest < ActiveSupport::TestCase
  setup do 
    @dhl_creator = DhlCreator.new
    shipment_params_array = [
      {
          "tracking_number": "449044304137821",
          "carrier": "DHL"
      },
      {
          "tracking_number": "920241085725456",
          "carrier": "DHL"
      },
      {
          "tracking_number": "568838414941",
          "carrier": "DHL"
      }
    ]
    @shipments_by_carrier = Shipment.build_from_json_array(shipment_params_array)
  end

  test "should create SkyDhl object" do
    assert_equal SkyDhl, @dhl_creator.factory(@shipments_by_carrier["DHL"]).class
  end

  test "should not create diferent type from SkyDhl" do
    assert_not_equal SkyFedex, @dhl_creator.factory(@shipments_by_carrier["DHL"]).class
  end

  test "the carrier name should be DHL" do
    assert_equal "DHL", @dhl_creator.get_name
  end
end