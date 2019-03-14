class Api::V1::RebelsController < ApplicationController
	protect_from_forgery with: :null_session # this is for test with Postman

	def register_rebels
		require "./lib/general" 
		begin
			# Get sure we get two parameters
			if params[:name].present? and params[:planet].present?
				# We make de registration in a external File
				General::writeToFile "rebel "+params[:name]+" on "+params[:planet]+" at "+Time.now.strftime("%d/%m/%Y %H:%M:%S"),".","rebel_registrations" 
				# We answer with a succesful response
				json_response "Registrated rebel succesfully", true, {}, :ok
			# If don't have two parameters
			else
				# We answer with a Something went wrong response
				json_response "Something went wrong", false, {}, :not_found
				# and throw exception ArgumentError
				raise ArgumentError 
			end	
		rescue ArgumentError => e
			# We write in external file the error and the date
	        text_to_write = "wrong number of arguments "+DateTime.now.to_s+": "+e.to_s
	        General::writeToFile text_to_write,"log","registration_errors"
	        return
		end		
	end 
end