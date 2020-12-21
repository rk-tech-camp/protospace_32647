class PrototypesController < ApplicationController
	before_action :authenticate_user!,except: [:index, :show]

	before_action :contributor_confirmation, only: [:edit, :update, :destroy]



	
	def index
	
		@prototypes = Prototype.includes(:user)
	end

	def new
    @prototype = Prototype.new

  end

  def create
		@prototype = Prototype.new(prototype_params)
		if @prototype.save
			redirect_to root_path
		else  
			render :new
		end		
	end


	
	def destroy
		@prototype = Prototype.find(params[:id])
		if @prototype.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
	end
	
	def show
		
		@prototype = Prototype.find(params[:id])
	
	  @comment = Comment.new
		@comments = @prototype.comments.includes(:user)
		

	end
	
	def edit
		@prototype = Prototype.find(params[:id])
		
	end

	def update
		prototype = Prototype.find(params[:id])
		if  prototype.update(prototype_params)
		 
      redirect_to prototype_path(prototype)
    else
      render :edit
    end

		
	
		
	end


  private
  

	def prototype_params
    params.require(:prototype).permit(:title ,:image,:catch_copy,:concept).merge(user_id: current_user.id)
  end
	
	def contributor_confirmation
		@prototype = Prototype.find(params[:id])
    redirect_to root_path unless current_user == @prototype.user
	end
	
	


end
