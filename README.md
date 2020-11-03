# React Relay ReScript Boilerplate

Status: Early development

Spin up a local development environment with `docker-compose up`

Or locally:

```
cd server/graphql

yarn && yarn create-env && yarn start
```

```
cd ../../client

yarn && yarn update-schema-local && yarn relay && yarn start
```

It should now be accessible in the browser on http://localhost:3000


react-relay postinstall script only works on linux, so Windows users should use WSL 2 (or use docker) to make it work.
