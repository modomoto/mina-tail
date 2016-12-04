namespace :tail do
  desc 'Lists logs available to tail'
  task :list => :environment do
    in_path "#{current_path}" do
      log_path = "#{fetch(:current_path)}/log"
      command %{
        echo "-----> Log files in #{log_path}"
        #{%[ls #{log_path} | grep log]}
      }
    end
  end

  desc 'Shows live environment logs'
  task live: :environment do
    in_path "#{fetch(:current_path)}" do
      file = ENV['file'] || "#{fetch(:rails_env)}.log"
      command %[tail -f log/#{file}]
    end
  end

  desc "Show last lines of the environment logs"
  task :last => :environment do
    in_path "#{fetch(:current_path)}" do
      lines = ENV['lines'] || 2000
      file = ENV['file'] || "#{fetch(:rails_env)}.log"
      command %[tail -#{lines} log/#{file}]
    end
  end
end
