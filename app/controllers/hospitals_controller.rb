class HospitalsController < ApplicationController
  def index
  	@lon=params[:lon]
  	@lat=params[:lat]
  	if params[:search].present?
  		@heading_data="Hospitals Near to your location"
  		@timy="Maximum time taken by Ambulance: 12mins "
  		@hospitals = Hospital.near(params[:search],5)
  	else 
  		@heading_data="Hospitals List"

  		@hospitals = Hospital.all
  	end

  end

  

  def show
  	@hospital = Hospital.find(params[:id])
  end

  def new
  	@hospital = Hospital.new
  end

  def create 
  	@hospital = Hospital.new(hospital_params)
  		if @hospital.save
  			redirect_to @hospital
  		else
  			render  'new'
  		end
  end

  def edit
  	@hospital = Hospital.find(params[:id])
  end

  def update
		@hospital = Hospital.find(params[:id])

		if @hospital.update(hospital_params)
			redirect_to @hospital
		else
			render 'edit'
		end
	end

  def destroy
		@hospital=Hospital.find(params[:id])
		@hospital.destroy
		redirect_to hospitals_path
	end 

	

  private
  def hospital_params
		params.require(:hospital).permit(:name,:address,:latitude,:longitude,:number)
	end
end
