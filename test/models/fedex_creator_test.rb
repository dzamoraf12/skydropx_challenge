require 'test_helper'
 
class FedexCreatorTest < ActiveSupport::TestCase
  setup do 
    @fedex_creator = FedexCreator.new
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

  test "should create SkyFedex object" do
    assert_equal SkyFedex, @fedex_creator.factory(@shipments_by_carrier["FEDEX"]).class
  end

  test "should not create diferent type from SkyFedex" do
    assert_not_equal SkyDhl, @fedex_creator.factory(@shipments_by_carrier["FEDEX"]).class
  end

  test "the carrier name should be FedEx" do
    assert_equal "FedEx", @fedex_creator.get_name
  end
end