module MoviesHelper
  def embed_youtube(_url)
    tag.iframe(
      width: 710,
      height: 399,
      src: _url,
      frameborder: 0,
      allow: 'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture',
      allowfullscreen: true
    )
  end
end
