class SellAdsController < ApplicationController
  before_action :set_sell_ad, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /sell_ads
  # GET /sell_ads.json
  def index
    @sell_ads = SellAd.all
  end

  def search
   @sell_ads = SellAd.where("title LIKE ? OR description LIKE ?", "#{params[:q]}%", "% #{params[:q]}%")
   @result_length = @sell_ads.length
 end
  # GET /sell_ads/1
  # GET /sell_ads/1.json
  def show
    @sell_ad.views += 1
    @sell_ad.save!
  end

  # GET /sell_ads/new
  def new
    @sell_ad = SellAd.new
  end

  # GET /sell_ads/1/edit
  def edit
  end

  # POST /sell_ads
  # POST /sell_ads.json
  def create

    params = sell_ad_params
    if params[:title] == "" || params[:description] == "" || params[:location] == "" || params[:price] == "" || phone == ""
      #show errors
      return
    else
    @sell_ad = SellAd.new(sell_ad_params)
    @sell_ad.price = @sell_ad.price*100
    @sell_ad.user = current_user
    @sell_ad.views = 0
    if @sell_ad.phone.to_s.length > 10
      respond_to do |format|
        format.html { redirect_to @sell_ad, notice: 'Phone number must be Australian (10 digits or less)' }
        format.json { render :new, status: :created, location: @sell_ad }
      end
      return
    end
    respond_to do |format|
      if @sell_ad.save
        format.html { redirect_to @sell_ad, notice: 'Sell ad was successfully created.' }
        format.json { render :show, status: :created, location: @sell_ad }
      else
        format.html { render :new }
        format.json { render json: @sell_ad.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  # PATCH/PUT /sell_ads/1
  # PATCH/PUT /sell_ads/1.json
  def update
    respond_to do |format|
      if @sell_ad.update(sell_ad_params)
        format.html { redirect_to @sell_ad, notice: 'Sell ad was successfully updated.' }
        format.json { render :show, status: :ok, location: @sell_ad }
      else
        format.html { render :edit }
        format.json { render json: @sell_ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sell_ads/1
  # DELETE /sell_ads/1.json
  def destroy
    @sell_ad.destroy
    respond_to do |format|
      format.html { redirect_to sell_ads_url, notice: 'Sell ad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sell_ad
      @sell_ad = SellAd.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sell_ad_params
      params.require(:sell_ad).permit(:title, :description, :location, :image, :phone, :price)
    end
end
