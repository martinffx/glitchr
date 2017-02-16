defmodule Mix.Tasks.Docker do
  use Mix.Task

  @shortdoc "Run Docker Compose to start up an orchestrated multi-container
  runtime of this project. Options: up, down, release, build"

  def run(args) do
    case Mix.shell.cmd("docker-compose version", [quiet: true]) do
      0 ->
        docker(args)
      _err ->
        Mix.shell.error "docker-compose executable not found.
        Installation page: https://docs.docker.com/compose/install"
    end
  end

  def docker(["up", args]) do
    Mix.shell.cmd("docker-compose up")
  end

  def docker(["down", args]) do
    Mix.shell.cmd("docker-compose down")
  end

  def docker(["build"]) do
    version = Keyword.fetch!(Mix.Project.config, :version)
    Mix.shell.info "Version: #{version}"
    Mix.shell.cmd("docker build -t martinffx/glitchr .")
    Mix.shell.cmd("docker tag martinffx/glitchr:latest martinffx/glitchr:#{version}")
  end

  def docker(["release"]) do
    version = Keyword.fetch!(Mix.Project.config, :version)
    Mix.shell.info "Version: #{version}"
    Mix.shell.cmd("docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS")
    Mix.shell.cmd "docker push martinffx/glitchr:#{version}"
  end

  def docker(["deploy"]) do
    version = Keyword.fetch!(Mix.Project.config, :version)
    Mix.shell.info "Version: #{version}"
  end
end
