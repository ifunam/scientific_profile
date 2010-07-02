class Document < ActiveRecord::Base
  mount_uploader :file, DocumentUploader
  belongs_to :documentable, :polymorphic => true
end
