class Song < ActiveRecord::Base
	belongs_to :playlist
	if Rails.env.development?
		has_attached_file :file
	else
		has_attached_file :file, {
			:storage => :s3,
			:bucket => "rgr13-playlist",
			:path => "/thestubborndev/:class/:attachment/:id_partition/:style/:filename",
			:s3_credentials => YAML.load(ERB.new(File.read(Rails.root + 'config/s3.yml.erb')).result(binding))
		}
	end
	attr_accessible :file
end
