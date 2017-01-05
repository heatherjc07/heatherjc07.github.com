require "jekyll"
require "tmpdir"

# Change your GitHub reponame
GITHUB_REPONAME = "heatherjc07/heatherjc07.github.com"

desc "Generate blog files"
task :generate do
   system "bundle exec jekyll build"
end


desc "Generate and publish blog to gh-pages"
task :publish => [:generate] do
    tmp = Dir.mktmpdir nil, './tmp'
    cp_r "_site/.", tmp
    Dir.chdir tmp
    system "git init"
    system "git add ."
    system "git commit -m 'site updated'"
    system "git remote add origin https://github.com/#{GITHUB_REPONAME}.git"
    system "git push origin master --force"
end

