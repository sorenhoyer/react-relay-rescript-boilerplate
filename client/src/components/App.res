@react.component
let make = () => {
  <div
    style={ReactDOM.Style.make(
      ~display="grid",
      ~gridTemplateAreas="'navigation main'",
      ~gridTemplateColumns="16rem auto",
      (),
    )}>
    <div style={ReactDOM.Style.make(~gridArea="navigation", ())}> <Navigation /> </div>
    <div style={ReactDOM.Style.make(~gridArea="main", ())}>
      <React.Suspense fallback={<div> {React.string("Loading main...")} </div>}>
        <Main />
      </React.Suspense>
    </div>
  </div>
}
