require "bundler/gem_tasks"

require "sprockets"
require 'pathname'
require 'logger'
require 'fileutils'
require 'coffee_script'

ROOT        = Pathname(File.dirname(__FILE__))
LOGGER      = Logger.new(STDOUT)
BUNDLES     = %w( chosen.jquery.js )
COPIES     = %w( chosen.scss )
BUILD_DIR   = ROOT.join("vendor")
SOURCE_DIR  = ROOT.join("src")

task :compile do
  sprockets = Sprockets::Environment.new(ROOT) do |env|
    env.logger = LOGGER
    env.unregister_preprocessor('text/css', Sprockets::DirectiveProcessor)
  end

  sprockets.append_path(SOURCE_DIR.join('javascripts').to_s)
  sprockets.append_path(SOURCE_DIR.join('stylesheets').to_s)

  BUNDLES.each do |bundle|
    assets = sprockets.find_asset(bundle)
    prefix, basename = assets.pathname.to_s.split('/')[-2..-1]
    FileUtils.mkpath BUILD_DIR.join(prefix)

    assets.write_to(BUILD_DIR.join(prefix, basename))
    # If we want to produce independent assets as well
    #assets.to_a.each do |asset|
    #  # strip filename.css.foo.bar.css multiple extensions
    #  realname = asset.pathname.basename.to_s.split(".")[0..1].join(".")
    #  asset.write_to(BUILD_DIR.join(prefix, realname))
    #end
  end

  COPIES.each do |copy|
  	assets_pathname = sprockets.resolve(copy)
  	prefix, basename = assets_pathname.to_s.split('/')[-2..-1]
  	FileUtils.mkpath BUILD_DIR.join(prefix)
  	FileUtils.cp assets_pathname, BUILD_DIR.join(prefix, basename)
  end

end