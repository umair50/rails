class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  
  def new
    @article = Article.new
  
  end
  
  
  def create
    @article = Article.new(article_params)
    
    @article.user_id= current_user.id
    if @article.save
      respond_to do |format|
       
  
        format.js

      end
    end
    redirect_to articles_path
  end
  
  def index
    
    @abc=Article.all.page(params[:page]).per(10)
  
  end
  
  
  def show
    
    @article = Article.find(params[:id])
    @category=Category.find(@article.category_id)
  
  
  end
  
  def edit
    @article=Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
  
  def destroy
    
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
  
  def show_ca
  
  end
  
  
  private
  def article_params
    params.require(:article).permit(:title, :text, :category_id)
  end
end
