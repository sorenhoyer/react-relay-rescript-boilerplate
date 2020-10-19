@react.component
let make = () => {
  <div>
    <React.Suspense fallback={<div> {React.string("Loading...")} </div>}> <Main /> </React.Suspense>
  </div>
}
