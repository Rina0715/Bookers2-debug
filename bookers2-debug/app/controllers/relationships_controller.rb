class RelationshipsController < ApplicationController
  # before_action :set_user

  # def create
  #   @user = User.find(params[:followed_id])
  #   current_user.follow(@user)
  #   redirect_to @user
  # end

  # def destroy
  #   @user = Relationship.find(params[:id]).followed
  #   current_user.unfollow(@user)
  #   redirect_to @user
  # end

  # private

  # # def set_user
  # #   @user = User.find(params[:relationship, :followed_id])
  # # end

 # ——————フォロー機能を作成・保存・削除する————————————
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end
#————————フォロー・フォロワー一覧を表示する-————————————
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

end
