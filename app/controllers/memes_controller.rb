class MemesController < ApplicationController

  def index
    @memes = Meme.all
  end

  def add
    @user_id = current_user.id
    @user = User.find(@user_id)
    @meme_get = params[:id].to_i
    @user.memes << Meme.find(@meme_get)

    p @user.memes

     flash[:notice] = 'Meme was saved.'
     redirect_to user_path(@user)
  end

  def meme_gallery
    API.refresh #remove this in production
    @memes = Meme.all
    respond_to do |format|
      format.html {render '_meme_gallery'}
      format.js
    end
  end

  def meme_params
    params.require(:memes).permit(:id)
  end

  def find_user
  @user = User.find(params[:id])
  end

end
