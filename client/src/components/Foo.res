module Query = %relay.query(
  `
    query FooQuery($id: ID!) {
      foo(id: $id) {
        id
        text
      }
    }
  `
)

@react.component
let make = (~fooQueryPreloaded) => {
  let query = Query.usePreloaded(~queryRef=fooQueryPreloaded, ())

  {
    switch query.foo {
    | Some({text}) => <div> {text->React.string} </div>
    | None => React.null
    }
  }
}
