class PrototypesController < ApplicationController
  # ログインしていないユーザーが投稿・編集ページにアクセスするとログインページにいく
  before_action :authenticate_user!, only: [:edit, :new]
  # 投稿者本人以外がeditアクションにアクセスしたらトップページにリダイレクトする
  before_action :move_to_index, only: [:edit]

  # indexアクションの定義
  def index
    @prototypes = Prototype.all
  end

  # showアクションの定義
  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  # newアクションの定義
  def new
    @prototype = Prototype.new
  end

  # createアクションの定義
  def create
    @prototype = Prototype.new(prototype_params)
    # データを保存できたらルートパスへ、保存できなかったら新規投稿ページへ戻る。
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  # editアクションの定義
  def edit
    @prototype = Prototype.find(params[:id])
  end

  # updateアクションの定義
  def update
    prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
      redirect_to prototype_path
    else
      render :edit
    end
  end

  # destroyアクションの定義
  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @prototype = Prototype.find(params[:id])
    unless @prototype.user_id == current_user.id
      redirect_to action: :index
    end
  end

end