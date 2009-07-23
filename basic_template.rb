run "echo TODO > README"

gem "mislav-will_paginate",
    :lib => "will_paginate",
    :source => "http://gems.github.com"

if yes?("Users and authentication?")
  gem "authlogic"
end

rake "gems:install"
rake "gems:unpack"

generate :controller "home index"
route "map.root :controller => 'home'"
run "rm public/index.html"

git :init

file ".gitignore", <<-END
.DS_Store
.Thumbs
.*.sw?
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
config/initializers/session_store.rb
Capfile
END

run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
run "cp config/database.yml config/example_database.yml"

git :add => "."
git :commit => "-m 'Initial commit'"

