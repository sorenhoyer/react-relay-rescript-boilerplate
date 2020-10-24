module Query = %relay.query(
  `
    query MainQuery {
      foos {
        id
        text
      }
    }
  `
)

@react.component
let make = () => {
  let query = Query.use(~variables=(), ())

  <div>
    <p> {React.string("React Relay ReScript Boilerplate")} </p>
    {switch query.foos {
    | Some(foos) => <ul> {foos->Belt.Array.map(foo =>
          switch foo {
          | None => React.null
          | Some({text}) => <li> {text->React.string} </li>
          }
        )->React.array} </ul>
    | None => React.null
    }}
    <Foo id="cdfda462-7fe0-4d15-ae38-164e92040f19" />
  </div>
}
