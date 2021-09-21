<p align="center">
<a href="https://console.platform.sh/projects/create-project/?template=https://github.com/vincenzo/wikijs-platformsh/blob/master/template-definition.yaml&utm_campaign=deploy_on_platform?utm_medium=button&utm_source=affiliate_links&utm_content=https://github.com/vincenzo/wikijs-platformsh/blob/master/template-definition.yaml" target="_blank" title="Deploy with Platform.sh"><img src="https://platform.sh/images/deploy/deploy-button-lg-blue.svg"></a>
</p>

# Wiki.js for Platform.sh

This template provides a basic [Wiki.js](https://js.wiki/) set-up.  It comes pre-configured to use PostgreSQL. It is intended for you to use as a starting point and modify for your own needs.

## Features

* Node.js 16
* PostgreSQL 13
* Wiki.js 2.5.x
* Automatic TLS certificates

## Build and deployment

The software is currently not built from source code, but is installed from a release package. The configuration file is dynamically generated based on Platform.sh environment variables.

## Source operations

This template adopts [source operations](https://docs.platform.sh/configuration/app/source-operations.html#source-operations-usage-examples). There is one such operation defined, namely `core-update`. This can be executed from platform checkout of your project, as follows

```shell
platform source-operation:run core-update
```

(or you use the `-p` and `-e` switches if you are running the command from outside the checkout of the project)

It's also set up to run every day at midnight: 

```yaml
crons:
  update:
    # Run the 'update' source operation every day at midnight.
    spec: '0 0 * * *'
    cmd: |
      set -e
      if [ "$PLATFORM_BRANCH" = "master" ]; then
          platform source-operation:run core-update --no-wait --yes
      fi
```

## Local development with Lando

[Lando](https://lando.dev/) vastly simplifies local development and DevOps, and it is Platform.sh’s recommended local development tool, as Lando now includes direct support for Platform.sh projects.

This template already includes a `.lando.upstream.yml` with some default configurations. All you need to do is to follow the [Quick Start](https://docs.platform.sh/development/local/lando.html#quick-start) as per Platform.sh's own documentation. But in short, once you have Lando installed, you should be able to do (from the checkout of your Platform.sh project): 

```sh
lando init --source cwd --recipe platformsh # follow the instruction on screen
lando start
```

and you'll have a container-based development environment that reflects the Platform.sh deployment, including all build and deploy steps.

## References

* [Wiki.js](https://js.wiki/)
* [Node.js on Platform.sh](https://docs.platform.sh/languages/nodejs.html)
