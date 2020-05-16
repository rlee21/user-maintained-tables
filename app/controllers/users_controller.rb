class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :giveaway]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account was successfully created"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = "User was successfully updated."
      redirect_to @user
    else
      flash[:error] = "ERROR: User was NOT successfully updated."
      redirect_to @user
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = "User was successfully destroyed.."
      redirect_to users_url
    end
  end

  def giveaway
    reset_giveaway_winner
    if @user.update(giveaway_winner: true)
      flash[:success] = "User was successfully selected as the Giveaway Winner!"
      redirect_to @user
    else
      flash[:error] = "ERROR: User was NOT successfully updated."
      redirect_to @user
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :billing_address, :shipping_address, :admin)
    end

    def reset_giveaway_winner
      User.where(giveaway_winner: true).update(giveaway_winner: false)
    end
end
