class BumpListController < ApplicationController

	layout "app", :except => :list


	def index
		@days = params[:id]
		@days ||= 1.to_s
	end

	def list
		puts "params[:id]"
		params[:start_day] ||= 0
		params[:end_day] ||= params[:start_day]
		@list = Ranked.find_all_by_day(params[:start_day]..params[:end_day], :order => "item_name ASC, day ASC")

		respond_to do |format|
      format.html # list.html.erb
      format.xml  { render :xml => @list}
      format.json { render :json => @list}
    end

		def rank
		end

		def upload
			upload = params[:upload]
			name =  upload['datafile'].basename
			directory = "public/data"
			# create the file path
			path = File.join(directory, name)
			# write the file
			File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
		end

		def cleanup
			File.delete("#{RAILS_ROOT}/dirname/#{@filename}") if File.exist?("#{RAILS_ROOT}/dirname/#{@filename}")
		end
	end
end
