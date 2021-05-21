class PostsController < ApplicationController
  before_action :set_post, only: %i[show create update delete]
  before_action :authorize_request, except: %i[index]
  # To do check relacion con usuario

  def index
    if params[:query].present?
    @posts = Post.where('title @@ ?', "%#{params[:query]}%")
    # hacer el filtro
    else
      sorted_post
    end
  end

  def show
    # not_found
    # si no existe devolver mensaje de error
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render :show
    else
      not_found
    end
  end

  def update
    @post = Post.update(post_params)
    if @post.save
      render :show
    else
      # cuando no lo encunetra
    end
  end

  def destroy
    if @post.destroy
      head(:ok)
    else
      render_error
      # cuando no lo encuentra
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :contents, :user_id)
  end

  def render_error
  render json: { errors: object.errors.full_messages },
                  status: :unprocessable_entity
  end

  def sorted_post
    @posts = Post.all
    @posts.sort_by { post | post.created_at }
  end
end
