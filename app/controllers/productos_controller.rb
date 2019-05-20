class ProductosController < ApplicationController
	def index
		@productos_por_nombre = Producto.order(:nombre).limit 10
		@productos_por_precio = Producto.order(:precio).limit 3
	end

	def new
		@producto = Producto.new
	end

	def buscar
		#productos_a_buscar = "%#{params[:nombre]}%"
		@nombre_a_buscar = params[:nombre]
		@productos = Producto.where "nombre like ?", "%#{@nombre_a_buscar}%"
	end

	def create
		#valores = params.require(:producto).permit! 03/10/2018
		
		#La seguridad es importante

		valores = params.require(:producto).permit :nombre, :precio, :descripcion, :cantidad
		@producto = Producto.new valores
		if @producto.save
			flash[:notice] = "Producto grabado correctamente"
			redirect_to root_url
		else
			render :new
		end

		#nombre = params["nombre"]
		#descripcion = params["descripcion"]
		#cantidad = params["cantidad"]
		#precio = params["precio"]
		#puts nombre
		#puts descripcion
		#puts cantidad
		#puts precios
	end

	def destroy
		id = params[:id]
		Producto.destroy id
		redirect_to root_url
	end
end
