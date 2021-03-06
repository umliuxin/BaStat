module Admin
  class PlayersController < AdminController
    def index
      @players = Player.all
    end

    def new
    end

    def show
      @player = Player.find(params[:id])
    end

    def create
      if @player = Player.create(player_params)
        redirect_to admin_player_path(@player)
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
        redirect_to admin_player_path(@player)
      else
        flash[:danger] = @player.errors.full_messages[0]
        render 'edit'
      end
    end

    def destroy
      @player = Player.find(params[:id])
      @player.destroy

      redirect_to admin_player_path
    end

    private

    def player_params
      params.require(:player).permit(:name, :number, :image_url, :bio, :height, :weight, :position, :birthday)
    end

  end
end
