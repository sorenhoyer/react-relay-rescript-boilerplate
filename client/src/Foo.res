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
let make = (~id) => {
  let query = Query.use(
    ~variables={
      id: id,
    },
    (),
  )

  {
    switch query.foo {
    | Some({text}) => <div> {text->React.string} </div>
    | None => React.null
    }
  }
}
