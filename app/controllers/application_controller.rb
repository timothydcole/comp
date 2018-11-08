class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

    def index
    end

    def profile
      @user = User.find(current_user.id)
      if(SellAd.exists?(user_id: current_user.id))
        @ads = SellAd.where(user_id: current_user.id)
        @adlength = @ads.length
      else
        @adlength = 0
      end

      if(PurchaseAd.exists?(user_id: current_user.id))
        @purchases = PurchaseAd.where(user_id: current_user.id)
        @purchaselength = @purchases.length
      else
        @purchaselength = 0
      end

      if(PurchaseBid.exists?(user_id: current_user.id))
        @purchasebids = PurchaseBid.where(user_id: current_user.id)
        @purchasebidslength = @purchasebids.length
      else
        @purchasebidslength = 0
      end
    end

    def public_profile
      @user = User.find(params[:id])
        if(SellAd.exists?(user_id: @user.id))
          @ads = SellAd.where(user_id: @user.id)
          @adlength = @ads.length
        else
          @adlength = 0
        end
    end

  protected
    def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
