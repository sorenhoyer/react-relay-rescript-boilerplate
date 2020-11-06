module Query = %relay.query(
  `
    query FoosQuery {
      foos {
        id
        text
      }
    }
  `
)

@react.component
let make = (~preloadedQuery) => {
  let query = Query.usePreloaded(~queryRef=preloadedQuery, ~renderPolicy=Partial, ())

  <div>
    <p> {React.string("React Relay ReScript Boilerplate")} </p>
    {switch query.foos {
    | Some(foos) => <ul> {foos->Belt.Array.map(foo =>
          switch foo {
          | Some({id, text}) =>
            <li>
              <ReasonRelayRouter.Link to_={"/foo/" ++ id}>
                {text->React.string}
              </ReasonRelayRouter.Link>
            </li>
          | None => React.null
          }
        )->React.array} </ul>
    | None => React.null
    }}
  </div>
}
