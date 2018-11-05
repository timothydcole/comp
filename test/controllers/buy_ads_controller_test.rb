require 'test_helper'

class BuyAdsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @buy_ad = buy_ads(:one)
  end

  test "should get index" do
    get buy_ads_url
    assert_response :success
  end

  test "should get new" do
    get new_buy_ad_url
    assert_response :success
  end

  test "should create buy_ad" do
    assert_difference('BuyAd.count') do
      post buy_ads_url, params: { buy_ad: { description: @buy_ad.description, location: @buy_ad.location, phone: @buy_ad.phone, title: @buy_ad.title, user_id: @buy_ad.user_id, views: @buy_ad.views } }
    end

    assert_redirected_to buy_ad_url(BuyAd.last)
  end

  test "should show buy_ad" do
    get buy_ad_url(@buy_ad)
    assert_response :success
  end

  test "should get edit" do
    get edit_buy_ad_url(@buy_ad)
    assert_response :success
  end

  test "should update buy_ad" do
    patch buy_ad_url(@buy_ad), params: { buy_ad: { description: @buy_ad.description, location: @buy_ad.location, phone: @buy_ad.phone, title: @buy_ad.title, user_id: @buy_ad.user_id, views: @buy_ad.views } }
    assert_redirected_to buy_ad_url(@buy_ad)
  end

  test "should destroy buy_ad" do
    assert_difference('BuyAd.count', -1) do
      delete buy_ad_url(@buy_ad)
    end

    assert_redirected_to buy_ads_url
  end
end
