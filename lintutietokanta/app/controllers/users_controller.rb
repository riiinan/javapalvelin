class UsersController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
  def create
    @article = Article.find(params[:article_id])
    @user = @article.users.create(user_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @user = @article.users.find(params[:id])
    @user.destroy
    redirect_to article_path(@article)
  end

  def new
  end

  def create
    user = User.new(user_params)
   if user.save
     session[:user_id] = user.id
     redirect_to '/'
   else
     redirect_to '/signup'
   end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
