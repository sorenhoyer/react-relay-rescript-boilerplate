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
    <p> {React.string("Test2")} </p>
    {switch query.foos {
    | None => <p> {React.string("no foos")} </p>
    | Some(foos) => <ul> {foos->Belt.Array.map(foo =>
          switch foo {
          | None => <li> {React.string("None")} </li>
          | Some({text}) => <li> {text->React.string} </li>
          }
        )->React.array} </ul>
    }}
  </div>
}
