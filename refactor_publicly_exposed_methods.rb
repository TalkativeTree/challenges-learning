class Api::PostsController < Api::Base
  def create
      service = PostService.new
      service.delegate = Response.new(self)
      service.create_new_post(params[:post])
  end
end

class Response < SimpleDelegator
  def new_post_created_successfully(post)
    render :json => post.to_json
  end

  def new_post_not_created_because_of(errors)
    render :json => {
      :errors => errors
    }.to_json
  end
end

#previous

class Api::PostsController < Api::Base
  def create
      service = PostService.new
      service.delegate = self
      service.create_new_post(params[:post])
  end

  # PostServiceProtocol begins
  def new_post_created_successfully(post)
    render :json => post.to_json
  end

  def new_post_not_created_because_of(errors)
    render :json => {
      :errors => errors
    }.to_json
  end
  # PostServiceProtocol ends
end