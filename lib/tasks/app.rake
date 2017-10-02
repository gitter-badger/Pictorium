namespace :app do
  task envset: %i[db:drop db:create db:migrate db:seed]
end
