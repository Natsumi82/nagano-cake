class Admins::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if params[:product][:price].present? && params[:product][:name].present? && params[:product][:explanation].present? && params[:product][:genre_id].present? && params[:product][:image].present?
      if params[:product][:price].to_s.ord >= 48 && params[:product][:price].to_s.ord <= 57
        if @product.save
          redirect_to admins_product_path(@product.id)
          flash[:success] = "商品を登録しました"
        else
          flash[:danger] = "必要情報を入力してください"
          render "admins/products/new"
        end
      else
        flash[:danger] = "価格は半角数字で記入してください"
        redirect_to new_admins_product_path
      end
    else
      unless @product.save
        flash[:danger] = "必要情報を入力してください"
        render "admins/products/new"
      end
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if params[:product][:price].present? && params[:product][:name].present? && params[:product][:explanation].present? && params[:product][:genre_id].present? && params[:product][:image].present?
      if params[:product][:price].to_s.ord >= 48 && params[:product][:price].to_s.ord <= 57
        if @product.update(product_params)
          redirect_to admins_product_path(@product.id)
          flash[:success] = "商品を更新しました"
        else
          flash[:danger] = "必要情報を入力してください"
          render "admins/products/edit"
        end
      else
        flash[:danger] = "価格は半角数字で記入してください"
        render "admins/products/edit"
      end
    else
      unless @product.update(product_params)
        flash[:danger] = "必要情報を入力してください"
        render "admins/products/edit"
      end
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :explanation, :image, :genre_id, :price, :is_enabled)
  end
end
