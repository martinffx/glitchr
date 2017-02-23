defmodule Mix.Tasks.Docker do
  use Mix.Task

  @shortdoc "Some tasks to version the docker images and push
  them to a repo and intiate a depoly of said images.
  Options: release, deploy"

  def run(args) do
    case Mix.shell.cmd("docker version", [quiet: true]) do
      0 ->
        docker(args)
      _err -> Mix.shell.error "docker executable not found."
    end
  end

  def docker(["release"]) do
    version = Keyword.fetch!(Mix.Project.config, :version)
    Mix.shell.info "Version: #{version}"
    Mix.shell.cmd "docker tag glitchr_web martinffx/glitchr:#{version}"
    Mix.shell.info "Logging into Docker Hub..."
    MIX.shell.cmd "docker login -u $DOCKER_USER -p $DOCKER_PASSWORD
    -e $DOCKER_EMAIL"
    Mix.shell.info "Pushing image..."
    Mix.shell.cmd "docker push martinffx/glitchr:#{version}"
  end

  def docker(["deploy"]) do
    version = Keyword.fetch!(Mix.Project.config, :version)
    Mix.shell.info "TODO: Deploy Version: #{version}"
  end
end
