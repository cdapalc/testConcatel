
module General
	# Method for writing text in a file
	def self.writeToFile text,folder,file_name 
      	file = Rails.root.to_s+"/"+folder+"/"+file_name+".txt"
	    File.new file,"w+" if !File.exist?(file)
	    out_file = File.new(file, "a")
	    out_file.puts(text)
	    out_file.close
    end
end