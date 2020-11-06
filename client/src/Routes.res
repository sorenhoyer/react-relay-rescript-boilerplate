let foosRoute = ReasonRelayRouter.Route.make(
  ~matchUrl=url =>
    switch url.path {
    | list{} => Some()
    | _ => None
    },
  ~prepare=() => FoosQuery_graphql.load(~environment=RelayEnv.environment, ~variables=(), ()),
  ~render=preloadedFoosQuery => <Foos preloadedQuery=preloadedFoosQuery />,
)

let fooRoute = ReasonRelayRouter.Route.make(
  ~matchUrl=url =>
    switch url.path {
    | list{"foo", fooId} => Some(fooId)
    | _ => None
    },
  ~prepare=fooId =>
    FooQuery_graphql.load(~environment=RelayEnv.environment, ~variables={id: fooId}, ()),
  ~render=fooQueryPreloaded => <Foo fooQueryPreloaded />,
)

let routerContext = ReasonRelayRouter.make([foosRoute, fooRoute])
