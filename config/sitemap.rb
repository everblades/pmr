# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.premedroadmap.com"

# pick a place safe to write the files
SitemapGenerator::Sitemap.public_path = 'tmp/'

# store on S3 using Fog
SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new

# inform the map cross-linking where to find the other maps
SitemapGenerator::Sitemap.sitemaps_host = "http://#{ENV['FOG_DIRECTORY']}.s3.amazonaws.com/"

# pick a namespace within your bucket to organize your maps
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
      Page.find_each do |page|
        add pages_path(page), :lastmod => page.updated_at
      end

      add '/blog', :priority => 0.7, :changefreq => 'daily'

      Post.find_each do |post|
        add posts_path(post), :lastmod => post.updated_at, :priority => 1, :changefreq => 'daily'
      end

      add '/contacts', :priority => 0.1, :changefreq => 'monthly'
end

SitemapGenerator::Sitemap.ping_search_engines