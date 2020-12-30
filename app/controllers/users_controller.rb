class UsersController < ApplicationController
  # showアクションの定義
  def show
    @user = User.find(params[:id])
    @prototypes =  @user.prototypes
  end
end
