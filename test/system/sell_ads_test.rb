require "application_system_test_case"

class SellAdsTest < ApplicationSystemTestCase
  setup do
    @sell_ad = sell_ads(:one)
  end

  test "visiting the index" do
    visit sell_ads_url
    assert_selector "h1", text: "Sell Ads"
  end

  test "creating a Sell ad" do
    visit sell_ads_url
    click_on "New Sell Ad"

    fill_in "Description", with: @sell_ad.description
    fill_in "Location", with: @sell_ad.location
    fill_in "Phone", with: @sell_ad.phone
    fill_in "Title", with: @sell_ad.title
    fill_in "User", with: @sell_ad.user_id
    fill_in "Views", with: @sell_ad.views
    click_on "Create Sell ad"

    assert_text "Sell ad was successfully created"
    click_on "Back"
  end

  test "updating a Sell ad" do
    visit sell_ads_url
    click_on "Edit", match: :first

    fill_in "Description", with: @sell_ad.description
    fill_in "Location", with: @sell_ad.location
    fill_in "Phone", with: @sell_ad.phone
    fill_in "Title", with: @sell_ad.title
    fill_in "User", with: @sell_ad.user_id
    fill_in "Views", with: @sell_ad.views
    click_on "Update Sell ad"

    assert_text "Sell ad was successfully updated"
    click_on "Back"
  end

  test "destroying a Sell ad" do
    visit sell_ads_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sell ad was successfully destroyed"
  end
end
