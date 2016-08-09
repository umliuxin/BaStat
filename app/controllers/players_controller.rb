class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def new
  end

  def show
    @player = Player.find(params[:id])
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to @player
    else
      flash[:danger] = @player.errors.full_messages[0]
      render 'new'
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(player_params)
      redirect_to @player
    else
      flash[:danger] = @player.errors.full_messages[0]
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def player_params
    params.require(:player).permit(:name, :number, :image_url, :bio, :height, :weight, :position)
  end

end
