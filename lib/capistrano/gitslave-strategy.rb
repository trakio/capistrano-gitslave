require 'capistrano/scm'
module Capistrano
  class Git < Capistrano::SCM

    module SlaveStrategy

      def test
        test! " [ -f #{repo_path}/HEAD ] "
      end

      def check
        unless test!(:git, :'ls-remote', repo_url)
          context.error "Repo `#{repo_url}` does not exists"
          return false
        end

        if context.capture(:git, :'ls-remote', repo_url).split("\n").select{ |i| i.include?("refs/heads/#{fetch(:branch)}") }.empty?
          context.error "Branch `#{fetch(:branch)}` not found in repo `#{repo_url}`"
          return false
        end

        true
      end

      def clone
        git :clone, '--mirror', repo_url, repo_path
        fetch(:git_slaves, []).each do
          git :clone, '--mirror', repo_url, repo_path
        end
      end

      def update
        git :remote, :update
      end

      def release
        puts caller
        git :clone, '-b', fetch(:branch), "file://#{repo_path}", release_path
        context.execute("(cd #{release_path} && gits populate)")
        context.execute("find #{release_path} -name '.git*' | xargs -I {} rm -rfv {}")
      end

      def fetch_revision
        context.capture(:git, "rev-parse --short #{fetch(:branch)}")
      end
    end
  end
end