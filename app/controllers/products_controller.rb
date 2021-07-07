class ProductsController < ApplicationController

   before_action :authenticate_user!, except: [:index, :show]
   helper_method :sort_column, :sort_direction
   require 'bigdecimal'
   require 'bigdecimal/util'

   # GET /products
   # GET /products.json
   def index
     @products = Product.order(sort_column + " " + sort_direction)
     if params[:search].present? && params[:filter].present?
       @parameter = params[:search].downcase
       @filter_param = params[:filter].to_d
       @products = Product.where("lower(name) LIKE :search", search: "%#{@parameter}%").where("our_price <= ?", params[:filter].to_d)
     elsif params[:search].present? && params[:filter].blank?
       @parameter = params[:search].downcase
       @filter_param = params[:filter].to_d
       @products = Product.where("lower(name) LIKE :search", search: "%#{@parameter}%")
     elsif params[:search].blank? && params[:filter].present?
       @parameter = params[:search].downcase
       @filter_param = params[:filter].to_d
       @products = Product.where("our_price <= ?", params[:filter].to_d)
     end

   end

   def new
     @product = Product.new
   end

   def show
     @product = Product.find(params[:id])
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


   private
     def product_params
       params.require(:product).permit(:name, :our_price)
     end

     def sort_column
       Product.column_names.include?(params[:sort]) ? params[:sort] : "name"
     end

     def sort_direction
       %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
     end
     def set_product
       @product= Product.find(params[:id])
     end

 end
