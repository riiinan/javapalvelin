class ArticlesController < ApplicationController
  before_filter :authorize
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def accept_and_redirect
    cookies[:email] = {:value => params[:q]}
    redirect_to articles_path
  end

  def index
    ##if cookies[:email].blank?
      #redirect_to '/welcome/index'
    #else
    @articles = Article.all
    #@articles = @articles.search(params[:search]) if params[:search].present?
    #end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy!

    redirect_to article_path
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
 end

 def edit
   @article = Article.find(params[:id])
 end

 def create
  @article = Article.new(article_params)

  if @article.save
    redirect_to @article
  else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def login
  end

private
  def article_params
    params.require(:article).permit(:title, :text, :time, :place)
  end
end
