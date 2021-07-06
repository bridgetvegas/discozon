class ProductsController < ApplicationController

   before_action :authenticate_user!, except: [:index, :show]

   # GET /products
   # GET /products.json
   def index
     @products = Product.all
   end

   def new
     @product = Product.new
   end

   def create
     @product = Product.create(product_params)
     redirect_to products_path
   end

   def edit
     @product = Product.find(params[:id])
   end

   def update
     @product = Product.find(params[:id])
     @product.update(product_params)
     redirect_to products_path
   end

   def destroy
     @product = Product.find(params[:id])
     @product.destroy
     redirect_to products_path
   end

   def search
     if params[:search].blank?
       redirect_to(root_path, alert: "Empty field!") and return
     else
       @parameter = params[:search].downcase
       @results = Product.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
     end
   end

   private
     def product_params
       params.require(:product).permit(:name, :our_price)
     end
 end
