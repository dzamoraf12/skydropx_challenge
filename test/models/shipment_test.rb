require 'test_helper'
 
class ShipmentTest < ActiveSupport::TestCase
  setup do 
    @shipment_params = {
      carrier: "fedex",
      tracking_number: "920241085725456"
    }

    shipment_params_array = [
      {
          "tracking_number": "449044304137821",
          "carrier": "FEDEX"
      },
      {
          "tracking_number": "920241085725456",
          "carrier": "FEDEX"
      },
      {
          "tracking_number": "568838414941",
          "carrier": "DHL"
      }
    ]
    @shipments_by_carrier = Shipment.build_from_json_array(shipment_params_array)
  end

  test "should report error" do
    assert_raises(ArgumentError) do
      Shipment.new
    end
  end

  test "should create an shipment object" do
    shipment = Shipment.new(@shipment_params)
    assert_equal "fedex", shipment.carrier
    assert_equal "920241085725456", shipment.tracking_number
  end

  test "should create a hash with 2 carriers keys" do
    assert_equal 2, @shipments_by_carrier.keys.length
    assert_equal ["FEDEX", "DHL"], @shipments_by_carrier.keys
  end

  test "fedex should have 2 shipments" do
    assert_equal 2, @shipments_by_carrier["FEDEX"].length
  end

  test "dhl should have 1 shipment" do
    assert_equal 1, @shipments_by_carrier["DHL"].length
  end
end