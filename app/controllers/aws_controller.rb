class AwsController < ApplicationController
  include AwsHelper
  skip_before_filter :authenticate_user!
  skip_before_filter :check_first_diagnostic_exam

  def generate_signed_s3_url
    # To avoid file collision, we prepend string to the filename
    filename = "#{SecureRandom.hex(4)}_#{params[:filename]}"

    # Content types
    content_type = params['content_type']

    resource_endpoint = "https://#{bucket}.s3.amazonaws.com/#{filename}"
    options = {
      http_verb: 'PUT',
      date: 1.hours.from_now.to_i,
      resource: "/#{bucket}/#{filename}",
      content_type: content_type
    }

    url = AwsHelper.build_s3_upload_url(resource_endpoint, access_key_id, secret_access_key, options)
    render json: { put_url: url, file_url: resource_endpoint, content_type: content_type }
  end

  private

  def access_key_id
    ENV['AWS_ACCESS_KEY_ID']
  end

  def secret_access_key
    ENV['AWS_SECRET_ACCESS_KEY']
  end

  def bucket
    ENV['S3_BUCKET_NAME']
  end
end
