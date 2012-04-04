# coding: utf-8
#set :application, "aurika-curkan"
#
#
#
#role :web, "62.152.60.154" # хост удалённого сервера                          # Your HTTP server, Apache/etc
#set :user, 'aurika-curkan' # пользователь удалённого сервера
#set :use_sudo, false
#role :db, "62.152.60.154", :primary => true
#role :app, "62.152.60.154"
#
#
#
#
## Директория приложения на удалённом хостинге
#set :app_dir, "/usr/local/www/vhosts/#{application}.ru/www/" # /home/myuser/myproject/
## Запись "/home/#{user}/#{application}/" аналогична "/home/$user/$application/" в PHP
#
## Директория, куда будет делаться checkout из репозитория
#set :deploy_to, "#{app_dir}" # /home/myuser/myproject/deploy
#set :deploy_via, :export
#
#set :scm, :subversion # используем subversion
#set :scm_user, 'korsar' # имя пользователя репозитория
#set :scm_pass, 'fktrctq'
#set :scm_url, "http://svn.xp-dev.com/svn/aurika-curkan/trunk" # svn://svnhost/trunk/myproject/
## Формируем команду svn checkout --username mysvnuser svn://host/trunk/myproject
#set :repository, Proc.new { "--username #{scm_user} --password #{scm_pass} #{scm_url}"}
#
#task :after_deploy do
#  deploy.cleanup
#  #run "bundle pack"
#end
#
#task :after_symlink, :roles => :web do
#  run "ln -nfs #{release_path} #{app_dir}"
#  run "chmod -R 0755 #{release_path}"
#  run "chmod 0744 #{release_path}/public/dispatch.fcgi"
#end


# По умолчанию для дистрибуции проектов используется Bundler.
# Эта строка включает автоматическое обновление и установку
# недостающих gems, указанных в вашем Gemfile.
#
## !!! Не забудьте добавить
# gem 'capistrano'
# gem 'unicorn'
#
# в ваш Gemfile.
#
# Если вы используете другую систему управления зависимостями,
# закомментируйте эту строку.
require 'bundler/capistrano'

# В rails 3 по умолчанию включена функция assets pipelining,
# которая позволяет значительно уменьшить размер статических
# файлов css и js.
# Эта строка автоматически запускает процесс подготовки
# сжатых файлов статики при деплое.
# Если вы не используете assets pipelining в своем проекте,
# или у вас старая версия rails, закомментируйте эту строку.
#load 'deploy/assets'

# Для удобства работы мы рекомендуем вам настроить авторизацию
# SSH по ключу. При работе capistrano будет использоваться
# ssh-agent, который предоставляет возможность пробрасывать
# авторизацию на другие хосты.
# Если вы не используете авторизацию SSH по ключам И ssh-agent,
# закомментируйте эту опцию.
ssh_options[:forward_agent] = true

# Имя вашего проекта в панели управления.
# Не меняйте это значение без необходимости, оно используется дальше.
set :application,     "aurika"

# Сервер размещения проекта.
set :deploy_server,   "hydrogen.locum.ru"

# Не включать в поставку разработческие инструменты и пакеты тестирования.
set :bundle_without,  [:development, :test]

set :user,            "hosting_lexakorsar"
set :login,           "lexakorsar"
set :use_sudo,        false
set :deploy_to,       "/home/#{user}/projects/#{application}"
set :unicorn_conf,    "/etc/unicorn/#{application}.#{login}.rb"
set :unicorn_pid,     "/var/run/unicorn/#{application}.#{login}.pid"
set :bundle_dir,      File.join(fetch(:shared_path), 'gems')
role :web,            deploy_server
role :app,            deploy_server
role :db,             deploy_server, :primary => true


# Следующие строки необходимы, т.к. ваш проект использует rvm.
set :rvm_ruby_string, "1.9.2"
set :rake,            "rvm use #{rvm_ruby_string} do bundle exec rake"
set :bundle_cmd,      "rvm use #{rvm_ruby_string} do bundle"


# Настройка системы контроля версий и репозитария,
# по умолчанию - git, если используется иная система версий,
# нужно изменить значение scm.
set :scm,             :git

# Предполагается, что вы размещаете репозиторий Git в вашем
# домашнем каталоге в подкаталоге git/<имя проекта>.git.
# Подробнее о создании репозитория читайте в нашем блоге
# http://locum.ru/blog/hosting/git-on-locum
set :repository,      "git://github.com/atarasov/aurika.git"

## Если ваш репозиторий в GitHub, используйте такую конфигурацию
# set :repository,    "git@github.com:username/project.git"

## Чтобы не хранить database.yml в системе контроля версий, поместите
## dayabase.yml в shared-каталог проекта на сервере и раскомментируйте
## следующие строки.

# after "deploy:update_code", :copy_database_config
# task :copy_database_config, roles => :app do
#   db_config = "#{shared_path}/database.yml"
#   run "cp #{db_config} #{release_path}/config/database.yml"
# end

## --- Ниже этого места ничего менять скорее всего не нужно ---

before 'deploy:finalize_update', 'set_current_release'
task :set_current_release, :roles => :app do
  set :current_release, latest_release
end


set :unicorn_start_cmd, "(cd #{deploy_to}/current; rvm use #{rvm_ruby_string} do bundle exec unicorn_rails -Dc #{unicorn_conf})"



# - for unicorn - #
namespace :deploy do
  desc "Start application"
  task :start, :roles => :app do
    run unicorn_start_cmd
  end

  desc "Stop application"
  task :stop, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -QUIT `cat #{unicorn_pid}`"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -USR2 `cat #{unicorn_pid}` || #{unicorn_start_cmd}"
  end
end