class Patient < ActiveRecord::Base
 
belongs_to :hospital
mount_uploader :report, ReportUploader
end
