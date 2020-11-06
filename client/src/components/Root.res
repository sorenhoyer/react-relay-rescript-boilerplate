@react.component
let make = () => {
  <ReasonRelay.Context.Provider environment=RelayEnv.environment>
    <React.Suspense fallback={<div> {React.string("Loading app...")} </div>}>
      <ReasonRelayRouter.Provider value={Some(Routes.routerContext)}>
        <App />
      </ReasonRelayRouter.Provider>
    </React.Suspense>
  </ReasonRelay.Context.Provider>
}
