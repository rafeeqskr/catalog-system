class NilClass
  def url
    'http://placehold.it/400x300'
  end
  def image
    nil
  end

  alias_method :remote_url, :url
end
