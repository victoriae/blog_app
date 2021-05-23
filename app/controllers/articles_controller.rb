class ArticlesController < ApplicationController
  load_and_authorize_resource
  before_action :set_article, only: %i[ show edit update destroy ]
  before_action :init_index, only: :index

  # GET /articles or /articles.json
  def index
    respond_to do |format|
      format.html
      format.js
    end
  end

  def init_index
    init_filterrific
  end

  def init_filterrific
    @filterrific = initialize_filterrific(
      Article.all.order(created_at: :desc),
      params[:filterrific],
      select_options: {
        with_category_id: categories,
        with_user_id: users
      }
    ) || return

    @articles = @filterrific.find.page(params[:page])

  end

  def categories
    articles = Article.all
    if articles.present?
      categories = articles.map do |article|
        [article.category.name, article.category.id]
      end
      categories.uniq
    else
      {}
    end
  end

  def users
    articles = Article.all
    if articles.present?
      users = articles.map do |article|
        [article.user.full_name, article.user.id]
      end
      users.uniq
    else
      {}
    end
  end

  # GET /articles/1 or /articles/1.json
  def show
    @comments = Comment.where(article_id: @article.id)
                       .order(created_at: :desc)

    @comment = Comment.new
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:category_id, :title, :content, :user_id, :active)
    end
end
