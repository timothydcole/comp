require "application_system_test_case"

class BuyAdsTest < ApplicationSystemTestCase
  setup do
    @buy_ad = buy_ads(:one)
  end

  test "visiting the index" do
    visit buy_ads_url
    assert_selector "h1", text: "Buy Ads"
  end

  test "creating a Buy ad" do
    visit buy_ads_url
    click_on "New Buy Ad"

    fill_in "Description", with: @buy_ad.description
    fill_in "Location", with: @buy_ad.location
    fill_in "Phone", with: @buy_ad.phone
    fill_in "Title", with: @buy_ad.title
    fill_in "User", with: @buy_ad.user_id
    fill_in "Views", with: @buy_ad.views
    click_on "Create Buy ad"

    assert_text "Buy ad was successfully created"
    click_on "Back"
  end

  test "updating a Buy ad" do
    visit buy_ads_url
    click_on "Edit", match: :first

    fill_in "Description", with: @buy_ad.description
    fill_in "Location", with: @buy_ad.location
    fill_in "Phone", with: @buy_ad.phone
    fill_in "Title", with: @buy_ad.title
    fill_in "User", with: @buy_ad.user_id
    fill_in "Views", with: @buy_ad.views
    click_on "Update Buy ad"

    assert_text "Buy ad was successfully updated"
    click_on "Back"
  end

  test "destroying a Buy ad" do
    visit buy_ads_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Buy ad was successfully destroyed"
  end
end
