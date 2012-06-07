require "guard-maven/version"
require 'guard'
require 'guard/guard'

module Guard
  class Maven < Guard
    def initialize(watchers, options)
      super
      @options = options
    end

    def start
      run_all if @options[:all_on_start]
    end

    def run_all
      system('mvn', 'clean', 'test')
      notify('')
    end

    def run_on_change(paths)
      puts paths
      # for now run all
      if paths.include? 'all'
        run_all
      else
        args = ['clean', 'test', '-Dtest=' + paths.join(',')]
        system('mvn', *args)
        notify('\n' + paths.join('\n'))
      end
    end

    private
    def notify(name)
      title = 'mvn test'
      message = "mvn test #{$?.success? ? 'passed' : 'failed'}#{name}"
      image = $?.success? ? :success : :failed
      Notifier.notify(message, title: title, image: image)
    end
  end
end
