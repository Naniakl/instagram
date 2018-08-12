class PagesController < ApplicationController
  def home
  	if !user_signed_in?
  	  redirect_to new_user_session_path
  	end
  end
  def show
   @pages = Pages.find(params(:id))
   respond_to do |format|
   format.html
   format.pdf do
   	pdf = Prawn::Document.new
   	pdf.text "Hello World"
   	send_data pdf.render
    end
   end
 end
end
