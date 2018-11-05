require 'test_helper'

class SellAdsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sell_ad = sell_ads(:one)
  end

  test "should get index" do
    get sell_ads_url
    assert_response :success
  end

  test "should get new" do
    get new_sell_ad_url
    assert_response :success
  end

  test "should create sell_ad" do
    assert_difference('SellAd.count') do
      post sell_ads_url, params: { sell_ad: { description: @sell_ad.description, location: @sell_ad.location, phone: @sell_ad.phone, title: @sell_ad.title, user_id: @sell_ad.user_id, views: @sell_ad.views } }
    end

    assert_redirected_to sell_ad_url(SellAd.last)
  end

  test "should show sell_ad" do
    get sell_ad_url(@sell_ad)
    assert_response :success
  end

  test "should get edit" do
    get edit_sell_ad_url(@sell_ad)
    assert_response :success
  end

  test "should update sell_ad" do
    patch sell_ad_url(@sell_ad), params: { sell_ad: { description: @sell_ad.description, location: @sell_ad.location, phone: @sell_ad.phone, title: @sell_ad.title, user_id: @sell_ad.user_id, views: @sell_ad.views } }
    assert_redirected_to sell_ad_url(@sell_ad)
  end

  test "should destroy sell_ad" do
    assert_difference('SellAd.count', -1) do
      delete sell_ad_url(@sell_ad)
    end

    assert_redirected_to sell_ads_url
  end
end
