class PatientsController < ApplicationController
	
	def new 

		@patient= Patient.new
	end

  def create 
  	@hospital = Hospital.find(params[:hospital_id])
	 	@patient = @hospital.patient.create(patient_params)
	 	redirect_to hospital_path(@hospital)
  	
  		if @patient.save
  			redirect_to @patient
  		else
  			render  'new'
  		end
  end

  def show

  	@patient = Patient.find(params[:id])
  end

  

  def destroy
		@patient=Patient.find(params[:id])
		@patient.destroy
		redirect_to patients_path
	end 

	

  private
  def patient_params
		params.require(:patient).permit(:name,:report)
	end


end
