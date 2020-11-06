@react.component
let make = () => {
  <ReasonRelayRouter.RouteRenderer
    renderFallback={() => <div> {React.string("loading")} </div>}
    renderNotFound={_ => <div> {React.string("No route matched :(")} </div>}
    renderPending={() => <div> {React.string("pending")} </div>}
  />
}
