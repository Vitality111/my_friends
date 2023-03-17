class MyFriendsController < ApplicationController
  before_action :set_my_friend, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :correct_user, only: %i[edit update destroy]

  def index
    @my_friends = MyFriend.all
  end

  def show; end

  def new
    @my_friend = current_user.my_friends.build
  end

  def edit; end

  def create
    @my_friend = current_user.my_friends.build(my_friend_params)
    respond_to do |format|
      if @my_friend.save
        format.html { redirect_to my_friend_url(@my_friend), notice: "My friend was successfully created." }
        format.json { render :show, status: :created, location: @my_friend }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @my_friend.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @my_friend.update(my_friend_params)
        format.html { redirect_to my_friend_url(@my_friend), notice: "My friend was successfully updated." }
        format.json { render :show, status: :ok, location: @my_friend }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @my_friend.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @my_friend.destroy
    respond_to do |format|
      format.html { redirect_to my_friends_url, notice: "My friend was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_my_friend
    @my_friend = MyFriend.find(params[:id])
  end

  def my_friend_params
    params.require(:my_friend).permit(:First_name, :Last_name, :Phone, :Email, :user_id)
  end

  def correct_user
    @friend = current_user.my_friends.find_by(id: params[:id])
    redirect_to my_friends_path, notice: "Not Authorized To Edit This Friend" unless @friend
  end
end
