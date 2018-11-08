class BuyAdsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_buy_ad, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


  # GET /buy_ads
  # GET /buy_ads.json
  def index
    @buy_ads = BuyAd.all
  end

  def accept_bid
    @buy_ad = BuyAd.find(params[:buy_id])
    @offer = User.find(params[:bid_user_id])
    @bid = Bid.find(params[:bid_id])

  end

  def see_bids
    @buy_ad = BuyAd.find(params[:id])
    if(Bid.exists?(buy_id: params[:id]))
      @bids = Bid.where(buy_id: params[:id])
      @number_of_bids = @bids.length
    else
      @number_of_bids = 0
    end
  end

  def make_bid
    @buy_ad = BuyAd.find(params[:id])
    @user = User.find(@buy_ad.user_id)
  end

  def submit_bid
    puts params
    @store = {
      :user_id => current_user.id,
      :price => params[:price],
      :message => params[:message],
      :buy_id => params[:buy_ad_id]
    }
    @bid = Bid.new(@store)
    @bid.save!
    redirect_to '/buy'
  end

  def delete_bid
    @bid = Bid.find(params[:id])
    @bid.destroy
    redirect_to '/buy'
  end

  # GET /buy_ads/1
  # GET /buy_ads/1.json
  def show
    @buy_ad.views += 1
    @buy_ad.save!
  end

  # GET /buy_ads/new
  def new
    @buy_ad = BuyAd.new
  end

  # GET /buy_ads/1/edit
  def edit
  end

  # POST /buy_ads
  # POST /buy_ads.json
  def create
    @buy_ad = BuyAd.new(buy_ad_params)
    @buy_ad.user = current_user
    @buy_ad.views = 0
    respond_to do |format|
      if @buy_ad.save
        format.html { redirect_to @buy_ad, notice: 'Buy ad was successfully created.' }
        format.json { render :show, status: :created, location: @buy_ad }
      else
        format.html { render :new }
        format.json { render json: @buy_ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buy_ads/1
  # PATCH/PUT /buy_ads/1.json
  def update
    respond_to do |format|
      if @buy_ad.update(buy_ad_params)
        format.html { redirect_to @buy_ad, notice: 'Buy ad was successfully updated.' }
        format.json { render :show, status: :ok, location: @buy_ad }
      else
        format.html { render :edit }
        format.json { render json: @buy_ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buy_ads/1
  # DELETE /buy_ads/1.json
  def destroy
    @buy_ad.destroy
    respond_to do |format|
      format.html { redirect_to buy_ads_url, notice: 'Buy ad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buy_ad
      @buy_ad = BuyAd.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def buy_ad_params
      params.require(:buy_ad).permit(:title, :description, :location, :phone, :image)
    end
end
