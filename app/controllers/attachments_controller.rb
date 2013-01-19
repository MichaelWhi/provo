class AttachmentsController < ApplicationController
  def index
     @attachments = Attachment.all
     render :json => @attachments.collect { |p| p.to_jq_upload }.to_json
   end

   def new
     @attachment = Attachment.new    # needed for form_for --> gets the path
   end

   def create
     @attachment = Attachment.new
     @attachment.file = params[:attachment][:path].shift
     if @attachment.save
       respond_to do |format|
         format.html {                                         #(html response is for browsers using iframe sollution)
           render :json => [@attachment.to_jq_upload].to_json,
           :content_type => 'text/html',
           :layout => false
         }
         format.json {
           render :json => [@attachment.to_jq_upload].to_json
         }
       end
     else
       render :json => [{:error => "custom_failure"}], :status => 304
     end
   end

   def destroy
     @attachment = Attachment.find(params[:id])
     @attachment.destroy
     render :json => true
   end
end
